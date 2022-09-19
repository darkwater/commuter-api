class CreateKv1 < ActiveRecord::Migration[7.0]
  def change
    create_table :kv1_org_units do |t|
      t.string :data_owner_code, limit: 10, null: false
      t.string :org_unit_code, limit: 10, null: false
      t.string :name, limit: 50, null: false
      t.string :org_unit_type, limit: 10, null: false
      t.string :description, limit: 255

      t.timestamps
    end

    add_index :kv1_org_units, [ :data_owner_code, :org_unit_code ], unique: true, name: 'index_kv1_org_units'

    create_table :kv1_higher_org_units do |t|
      t.string :data_owner_code, limit: 10, null: false
      t.string :org_unit_code_parent, limit: 10, null: false
      t.string :org_unit_code_child, limit: 10, null: false
      t.date :valid_from, null: false

      t.timestamps
    end

    add_index :kv1_higher_org_units, [ :data_owner_code, :org_unit_code_parent, :org_unit_code_child, :valid_from ], unique: true, name: 'index_kv1_higher_org_units'

    create_table :kv1_user_stop_points do |t|
      t.string :data_owner_code, limit: 10, null: false
      t.string :user_stop_code, limit: 10, null: false
      t.string :timing_point_code, limit: 10
      t.boolean :get_in, null: false
      t.boolean :get_out, null: false
      t.string :name, limit: 50, null: false
      t.string :town, limit: 50, null: false
      t.string :user_stop_area_code, limit: 10
      t.string :stop_side_code, limit: 10
      t.string :road_side_eq_data_owner_code, limit: 10
      t.integer :road_side_eq_unit_number
      t.integer :minimal_stop_time, null: false
      t.integer :stop_side_length
      t.string :description, limit: 255
      t.string :user_stop_type, limit: 10, null: false

      t.timestamps
    end

    add_index :kv1_user_stop_points, [ :data_owner_code, :user_stop_code ], unique: true, name: 'index_kv1_user_stop_points'

    create_table :kv1_user_stop_areas do |t|
      t.string :data_owner_code, limit: 10, null: false
      t.string :user_stop_area_code, limit: 10, null: false
      t.string :name, limit: 50, null: false
      t.string :town, limit: 50, null: false
      t.string :road_side_eq_data_owner_code, limit: 10
      t.integer :road_side_eq_unit_number
      t.string :description, limit: 255

      t.timestamps
    end

    add_index :kv1_user_stop_areas, [ :data_owner_code, :user_stop_area_code ], unique: true, name: 'index_kv1_user_stop_areas'

    create_table :kv1_timing_links do |t|
      t.string :data_owner_code, limit: 10, null: false
      t.string :user_stop_code_begin, limit: 10, null: false
      t.string :user_stop_code_end, limit: 10, null: false
      t.integer :minimal_drive_time
      t.string :description, limit: 255

      t.timestamps
    end

    add_index :kv1_timing_links, [ :data_owner_code, :user_stop_code_begin, :user_stop_code_end ], unique: true, name: 'index_kv1_timing_links'

    create_table :kv1_links do |t|
      t.string :data_owner_code, limit: 10, null: false
      t.string :user_stop_code_begin, limit: 10, null: false
      t.string :user_stop_code_end, limit: 10, null: false
      t.date :valid_from, null: false
      t.integer :distance, null: false
      t.string :description, limit: 255
      t.string :transport_type, limit: 5, null: false

      t.timestamps
    end

    add_index :kv1_links, [ :data_owner_code, :user_stop_code_begin, :user_stop_code_end, :valid_from, :transport_type ], unique: true, name: 'index_kv1_links'

    create_table :kv1_lines do |t|
      t.string :data_owner_code, limit: 10, null: false
      t.string :line_planning_number, limit: 10, null: false
      t.string :line_public_number, limit: 4, null: false
      t.string :line_name, limit: 50, null: false
      t.integer :line_ve_tag_number, null: false
      t.string :description, limit: 255
      t.string :transport_type, limit: 5, null: false
      t.integer :line_icon
      t.string :line_color, limit: 6
      t.string :line_text_color, limit: 6

      t.timestamps
    end

    add_index :kv1_lines, [ :data_owner_code, :line_planning_number ], unique: true, name: 'index_kv1_lines'

    create_table :kv1_destinations do |t|
      t.string :data_owner_code, limit: 10, null: false
      t.string :dest_code, limit: 10, null: false
      t.string :dest_name_full, limit: 50, null: false
      t.string :dest_name_main, limit: 24, null: false
      t.string :dest_name_detail, limit: 24
      t.boolean :relevant_dest_name_detail, null: false
      t.string :dest_name_main_21, limit: 21, null: false
      t.string :dest_name_detail_21, limit: 21
      t.string :dest_name_main_19, limit: 19, null: false
      t.string :dest_name_detail_19, limit: 19
      t.string :dest_name_main_16, limit: 16, null: false
      t.string :dest_name_detail_16, limit: 16
      t.integer :dest_icon
      t.string :dest_color, limit: 6
      t.string :dest_text_color, limit: 6

      t.timestamps
    end

    add_index :kv1_destinations, [ :data_owner_code, :dest_code ], unique: true, name: 'index_kv1_destinations'

    create_table :kv1_journey_patterns do |t|
      t.string :data_owner_code, limit: 10, null: false
      t.string :line_planning_number, limit: 10, null: false
      t.string :journey_pattern_code, limit: 10, null: false
      t.string :journey_pattern_type, limit: 10, null: false
      t.string :direction, limit: 10, null: false
      t.string :description, limit: 255

      t.timestamps
    end

    add_index :kv1_journey_patterns, [ :data_owner_code, :line_planning_number, :journey_pattern_code ], unique: true, name: 'index_kv1_journey_patterns'

    create_table :kv1_journey_pattern_timing_links do |t|
      t.string :data_owner_code, limit: 10, null: false
      t.string :line_planning_number, limit: 10, null: false
      t.string :journey_pattern_code, limit: 10, null: false
      t.integer :timing_link_order, null: false
      t.string :user_stop_code_begin, limit: 10, null: false
      t.string :user_stop_code_end, limit: 10, null: false
      t.string :confinrel_code, limit: 10, null: false
      t.string :dest_code, limit: 10, null: false
      t.boolean :is_timing_stop, null: false
      t.string :display_public_line, limit: 4
      t.integer :product_formula_type

      t.timestamps
    end

    add_index :kv1_journey_pattern_timing_links, [ :data_owner_code, :line_planning_number, :journey_pattern_code, :timing_link_order ], unique: true, name: 'index_kv1_journey_pattern_timing_links'
    add_index :kv1_journey_pattern_timing_links, [ :data_owner_code, :line_planning_number, :journey_pattern_code, :user_stop_code_begin, :user_stop_code_end ], unique: true, name: 'index_kv1_journey_pattern_timing_links_user_stop_codes'

    create_table :kv1_points do |t|
      t.string :data_owner_code, limit: 10, null: false
      t.string :point_code, limit: 10, null: false
      t.date :valid_from, null: false
      t.string :point_type, limit: 10, null: false
      t.string :rd_x, limit: 15, null: false
      t.string :rd_y, limit: 15, null: false
      t.string :location_z, limit: 15
      t.string :description, limit: 255

      t.timestamps
    end

    add_index :kv1_points, [ :data_owner_code, :point_code ], unique: true, name: 'index_kv1_points'

    create_table :kv1_point_on_links do |t|
      t.string :data_owner_code, limit: 10, null: false
      t.string :user_stop_code_begin, limit: 10, null: false
      t.string :user_stop_code_end, limit: 10, null: false
      t.date :link_valid_from, null: false
      t.string :point_data_owner_code, limit: 10, null: false
      t.string :point_code, limit: 10, null: false
      t.integer :distance, null: false
      t.integer :segment_speed
      t.integer :local_point_speed
      t.string :description, limit: 255
      t.string :transport_type, limit: 5, null: false

      t.timestamps
    end

    add_index :kv1_point_on_links, [ :data_owner_code, :user_stop_code_begin, :user_stop_code_end, :link_valid_from, :transport_type, :point_data_owner_code, :point_code ], unique: true, name: 'index_kv1_point_on_links'

    create_table :kv1_notices do |t|
      t.string :data_owner_code, limit: 10, null: false
      t.string :notice_code, limit: 20, null: false
      t.string :notice, limit: 1024, null: false

      t.timestamps
    end

    add_index :kv1_notices, [ :data_owner_code, :notice_code ], unique: true, name: 'index_kv1_notices'

    create_table :kv1_notice_assignments do |t|
      t.string :object, limit: 10, null: false
      t.string :data_owner_code, limit: 10, null: false
      t.string :line_planning_number, limit: 10, null: false
      t.string :notice_code, limit: 20, null: false
      t.string :timetable_version_code, limit: 10
      t.string :org_unit_code, limit: 10
      t.string :schedule_code, limit: 10
      t.string :schedule_type_code, limit: 10
      t.string :period_group_code, limit: 10
      t.string :specific_day_code, limit: 10
      t.string :day_type, limit: 10
      t.integer :journey_number
      t.integer :stop_order
      t.string :journey_pattern_code, limit: 10
      t.string :timing_link_code, limit: 10
      t.string :user_stop_code, limit: 10

      t.timestamps
    end

    add_index :kv1_notice_assignments, [ :object, :data_owner_code, :line_planning_number, :notice_code ], name: 'index_kv1_notice_assignments'

    create_table :kv1_time_demand_groups do |t|
      t.string :data_owner_code, limit: 10, null: false
      t.string :line_planning_number, limit: 10, null: false
      t.string :journey_pattern_code, limit: 10, null: false
      t.string :time_demand_group_code, limit: 10, null: false

      t.timestamps
    end

    add_index :kv1_time_demand_groups, [ :data_owner_code, :line_planning_number, :journey_pattern_code, :time_demand_group_code ], unique: true, name: 'index_kv1_time_demand_groups'

    create_table :kv1_time_demand_group_run_times do |t|
      t.string :data_owner_code, limit: 10, null: false
      t.string :line_planning_number, limit: 10, null: false
      t.string :journey_pattern_code, limit: 10, null: false
      t.string :time_demand_group_code, limit: 10, null: false
      t.integer :timing_link_order, null: false
      t.string :user_stop_code_begin, limit: 10, null: false
      t.string :user_stop_code_end, limit: 10, null: false
      t.integer :total_drive_time, null: false
      t.integer :drive_time, null: false
      t.integer :expected_delay
      t.integer :lay_over_time
      t.integer :stop_wait_time, null: false
      t.integer :minimum_stop_time

      t.timestamps
    end

    add_index :kv1_time_demand_group_run_times, [ :data_owner_code, :line_planning_number, :journey_pattern_code, :time_demand_group_code, :timing_link_order ], unique: true, name: 'index_kv1_time_demand_group_run_times'

    create_table :kv1_period_group do |t|
      t.string :data_owner_code, limit: 10, null: false
      t.string :period_group_code, limit: 10, null: false
      t.string :description, limit: 255

      t.timestamps
    end

    add_index :kv1_period_group, [ :data_owner_code, :period_group_code ], unique: true, name: 'index_kv1_period_group'

    create_table :kv1_specific_days do |t|
      t.string :data_owner_code, limit: 10, null: false
      t.string :specific_day_code, limit: 10, null: false
      t.string :name, limit: 50, null: false
      t.string :description, limit: 255

      t.timestamps
    end

    add_index :kv1_specific_days, [ :data_owner_code, :specific_day_code ], unique: true, name: 'index_kv1_specific_days'

    create_table :kv1_timetable_versions do |t|
      t.string :data_owner_code, limit: 10, null: false
      t.string :org_unit_code, limit: 10, null: false
      t.string :timetable_version_code, limit: 10, null: false
      t.string :period_group_code, limit: 10, null: false
      t.string :specific_day_code, limit: 10, null: false
      t.date :valid_from, null: false
      t.string :timetable_version_type, limit: 10, null: false
      t.date :valid_until
      t.string :description, limit: 255

      t.timestamps
    end

    add_index :kv1_timetable_versions, [ :data_owner_code, :org_unit_code, :timetable_version_code, :period_group_code, :specific_day_code ], unique: true, name: 'index_kv1_timetable_versions'

    create_table :kv1_public_journeys do |t|
      t.string :data_owner_code, limit: 10, null: false
      t.string :timetable_version_code, limit: 10, null: false
      t.string :org_unit_code, limit: 10, null: false
      t.string :period_group_code, limit: 10, null: false
      t.string :specific_day_code, limit: 10, null: false
      t.string :day_type, limit: 7, null: false
      t.string :line_planning_number, limit: 10, null: false
      t.integer :journey_number, null: false
      t.string :time_demand_group_code, limit: 10, null: false
      t.string :journey_pattern_code, limit: 10, null: false
      t.string :departure_time, limit: 8, null: false
      t.string :wheelchair_accessible, limit: 13, null: false
      t.boolean :data_owner_is_operator, null: false
      t.boolean :planned_monitored, null: false
      t.integer :product_formula_type

      t.timestamps
    end

    add_index :kv1_public_journeys, [ :data_owner_code, :timetable_version_code, :org_unit_code, :period_group_code, :specific_day_code, :day_type, :line_planning_number, :journey_number ], unique: true, name: 'index_kv1_public_journey'

    create_table :kv1_period_group_validities do |t|
      t.string :data_owner_code, limit: 10, null: false
      t.string :org_unit_code, limit: 10, null: false
      t.string :period_group_code, limit: 10, null: false
      t.date :valid_from, null: false
      t.date :valid_until

      t.timestamps
    end

    add_index :kv1_period_group_validities, [ :data_owner_code, :org_unit_code, :period_group_code, :valid_from ], unique: true, name: 'index_kv1_period_group_validity'

    create_table :kv1_exceptional_operating_days do |t|
      t.string :data_owner_code, limit: 10, null: false
      t.string :org_unit_code, limit: 10, null: false
      t.date :valid_date, null: false
      t.string :day_type_as_on, limit: 7, null: false
      t.string :specific_day_code, limit: 10, null: false
      t.string :period_group_code, limit: 10
      t.string :description, limit: 255

      t.timestamps
    end

    add_index :kv1_exceptional_operating_days, [ :data_owner_code, :org_unit_code, :valid_date ], unique: true, name: 'index_kv1_exceptional_operating_days'
  end
end
