require "open-uri"
require "zip"
require "csv"

OBJ_MAPPINGS = {
  "DEST" => {
    klass: Kv1::Destination,
    fields: [
      :data_owner_code, :dest_code, :dest_name_full, :dest_name_main,
      :dest_name_detail, :relevant_dest_name_detail, :dest_name_main_21,
      :dest_name_detail_21, :dest_name_main_19, :dest_name_detail_19,
      :dest_name_main_16, :dest_name_detail_16, :dest_icon, :dest_color,
      :dest_text_color,
    ]
  },
  "EXCOPDAY" => {
    klass: Kv1::ExceptionalOperatingDay,
    fields: [
      :data_owner_code, :org_unit_code, :valid_date, :day_type_as_on,
      :specific_day_code, :period_group_code, :description,
    ]
  },
  "JOPATILI" => {
    klass: Kv1::JourneyPatternTimingLink,
    fields: [
      :data_owner_code, :line_planning_number, :journey_pattern_code,
      :timing_link_order, :user_stop_code_begin, :user_stop_code_end, :confinrel_code,
      :dest_code, nil, :is_timing_stop, :display_public_line, :product_formula_type,
      # qbuzz has more fields here
    ]
  },
  "JOPA" => {
    klass: Kv1::JourneyPattern,
    fields: [
      :data_owner_code, :line_planning_number, :journey_pattern_code,
      :journey_pattern_type, :direction, :description,
    ]
  },
  "LINE" => {
    klass: Kv1::Line,
    fields: [
      :data_owner_code, :line_planning_number, :line_public_number, :line_name,
      :line_ve_tag_number, :description, :transport_type, :line_icon,
      :line_color, :line_text_color,
    ]
  },
  "LINK" => {
    klass: Kv1::Link,
    fields: [
      :data_owner_code, :user_stop_code_begin, :user_stop_code_end,
      :valid_from, :distance, :description, :transport_type,
    ]
  },
  "NOTICE" => {
    klass: Kv1::Notice,
    fields: [
      :data_owner_code, :notice_code, :notice,
    ]
  },
  "NTCASSGNM" => {
    klass: Kv1::NoticeAssignment,
    fields: [
      :data_owner_code, :notice_code, :object, :timetable_version_code,
      :org_unit_code, :schedule_code, :schedule_type_code, :period_group_code,
      :specific_day_code, :day_type, :line_planning_number, :journey_number,
      :stop_order, :journey_pattern_code, :timing_link_code, :user_stop_code,
    ]
  },
  "ORUN" => {
    klass: Kv1::OrgUnit,
    fields: [
      :data_owner_code, :org_unit_code, :name, :org_unit_type, :description,
    ]
  },
  "PEGRVAL" => {
    klass: Kv1::PeriodGroupValidity,
    fields: [
      :data_owner_code, :org_unit_code, :period_group_code, :valid_from,
      :valid_until,
    ]
  },
  # "PEGR" => {
  #   klass: Kv1::PeriodGroup,
  #   fields: [
  #     :data_owner_code, :period_group_code, :description,
  #   ]
  # },
  "POINT" => {
    klass: Kv1::Point,
    fields: [
      :data_owner_code, :point_code, :valid_from, :point_type, nil, :rd_x,
      :rd_y, :location_z, :description,
    ]
  },
  "POOL" => {
    klass: Kv1::PointOnLink,
    fields: [
      :data_owner_code, :user_stop_code_begin, :user_stop_code_end, :link_valid_from,
      :point_data_owner_code, :point_code, :distance, :segment_speed,
      :local_point_speed, :description, :transport_type,
    ]
  },
  "PUJO" => {
    klass: Kv1::PublicJourney,
    fields: [
      :data_owner_code, :timetable_version_code, :org_unit_code,
      :period_group_code, :specific_day_code, :day_type, :line_planning_number,
      :journey_number, :time_demand_group_code, :journey_pattern_code, :departure_time, :wheelchair_accessible,
      :data_owner_is_operator, :planned_monitored, :product_formula_type,
      # qbuzz has more fields here
    ]
  },
  "SPECDAY" => {
    klass: Kv1::SpecificDay,
    fields: [
      :data_owner_code, :specific_day_code, :name, :description,
    ]
  },
  "TILI" => {
    klass: Kv1::TimingLink,
    fields: [
      :data_owner_code, :user_stop_code_begin, :user_stop_code_end, :minimal_drive_time, :description,
    ]
  },
  "TIMDEMGRP" => {
    klass: Kv1::TimeDemandGroup,
    fields: [
      :data_owner_code, :line_planning_number, :journey_pattern_code, :time_demand_group_code,
    ]
  },
  "TIMDEMRNT" => {
    klass: Kv1::TimeDemandGroupRunTime,
    fields: [
      :data_owner_code, :line_planning_number, :journey_pattern_code,
      :time_demand_group_code, :timing_link_order, :user_stop_code_begin,
      :user_stop_code_end, :total_drive_time, :drive_time, :expected_delay,
      :lay_over_time, :stop_wait_time,
      # qbuzz has more fields here
    ]
  },
  "TIVE" => {
    klass: Kv1::TimetableVersion,
    fields: [
      :data_owner_code, :org_unit_code, :timetable_version_code,
      :period_group_code, :specific_day_code, :valid_from,
      :timetable_version_type, :valid_until, :description,
    ]
  },
  "USRSTAR" => {
    klass: Kv1::UserStopArea,
    fields: [
      :data_owner_code, :user_stop_area_code, :name, :town,
      :road_side_eq_data_owner_code, :road_side_eq_unit_number, :description,
    ]
  },
  "USRSTOP" => {
    klass: Kv1::UserStopPoint,
    fields: [
      :data_owner_code, :user_stop_code, :timing_point_code, :get_in, :get_out,
      nil, :name, :town, :user_stop_area_code, :stop_side_code,
      :road_side_eq_data_owner_code, :road_side_eq_unit_number,
      :minimal_stop_time, :stop_side_length, :description, :user_stop_type,
      nil,
    ]
  },
}

class Kv1::ImportAllJob < ApplicationJob
  queue_as :default

  def perform()
    url = URI("https://data.ndovloket.nl/qbuzz/kv1_NDOV_Drgl%20GD-20220914-20221210.zip")

    ActiveRecord::Base.transaction do
      OBJ_MAPPINGS.each do |k, mapping|
        mapping[:klass].delete_all
      end

      Zip::File.open(url.open) do |entries|
        entries.each do |entry|
          next if entry.directory?

          next if entry.name !~ /.*\.TMI$/

          objtype = entry.name[/^(.+?)X*\.TMI$/, 1]

          next if ["CNAREA", "CONFINREL", "ICON", "PEGR", "CONAREA"].include?(objtype)

          mapping = OBJ_MAPPINGS[objtype]

          pp objtype
          rows = CSV.parse(
            StringIO.new(entry.get_input_stream.read),
            skip_lines: /^[\[;]/, # skip ; and [ lines
            headers: false,
            col_sep: "|",
            liberal_parsing: true,
            strip: true,
          ).map do |objtype, _, _, *data|
            mapping[:fields].zip(data).reject{|k,v| k.nil?}.to_h
          end

          mapping[:klass].import!(rows)
        end
      end
    end
  end
end
