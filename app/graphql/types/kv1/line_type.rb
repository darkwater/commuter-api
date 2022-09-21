module Types
  module Kv1
    class LineType < Types::BaseObject
      description ""

      field :id, ID, null: false
      field :data_owner_code, String, null: false
      field :line_planning_number, String, null: false
      field :line_public_number, String, null: false
      field :line_name, String, null: false
      field :line_ve_tag_number, Integer, null: false
      field :description, String, null: true
      field :transport_type, String, null: false
      field :line_color, String, null: true
      field :line_text_color, String, null: true

      field :journey_patterns, Types::Kv1::JourneyPatternType.connection_type, null: false
      field :journey_pattern_timing_links, Types::Kv1::JourneyPatternTimingLinkType.connection_type, null: false
    end
  end
end
