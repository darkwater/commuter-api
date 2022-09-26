module Types
  module Kv1
    class UserStopPointType < Types::BaseObject
      description "A stop or other timing point on a route. Often has another stop on the other side of the road, part of the same stop area."

      field :id, ID, null: false
      field :data_owner_code, String, null: false
      field :user_stop_code, String, null: false
      field :user_stop_area_code, String, null: true
      field :timing_point_code, String, null: true
      field :get_in, Boolean, null: false
      field :get_out, Boolean, null: false
      field :name, String, null: false
      field :town, String, null: false
      field :stop_side_code, String, null: true
      field :road_side_eq_data_owner_code, String, null: true
      field :road_side_eq_unit_number, Integer, null: true
      field :minimal_stop_time, Integer, null: false
      field :stop_side_length, Integer, null: true
      field :description, String, null: true
      field :user_stop_type, String, null: false

      field :lat, Float, null: true
      field :long, Float, null: true

      field :stop_area, Types::Kv1::UserStopAreaType, null: true
      field :timing_links_from, Types::Kv1::TimingLinkType.connection_type, null: false
      field :timing_links_to, Types::Kv1::TimingLinkType.connection_type, null: false
      field :links_from, Types::Kv1::LinkType.connection_type, null: false
      field :links_to, Types::Kv1::LinkType.connection_type, null: false
      field :journey_pattern_timing_links_from, Types::Kv1::JourneyPatternTimingLinkType.connection_type, null: false
      field :journey_pattern_timing_links_to, Types::Kv1::JourneyPatternTimingLinkType.connection_type, null: false
      field :point_links_from, Types::Kv1::PointOnLinkType.connection_type, null: false
      field :point_links_to, Types::Kv1::PointOnLinkType.connection_type, null: false
      field :lines, Types::Kv1::LineType.connection_type, null: false
    end
  end
end
