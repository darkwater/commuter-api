module Types
  module Kv1
    class JourneyPatternTimingLinkType < Types::BaseObject
      description ""

      field :id, ID, null: false
      field :data_owner_code, String, null: false
      field :timing_link_order, Integer, null: false
      field :is_timing_stop, Boolean, null: false
      field :display_public_line, String, null: true
      field :product_formula_type, Integer, null: false

      field :line, Types::Kv1::LineType, null: true
      field :journey_pattern, Types::Kv1::JourneyPatternType, null: true
      field :stop_begin, Types::Kv1::UserStopPointType, null: true
      field :stop_end, Types::Kv1::UserStopPointType, null: true
      field :destination, Types::Kv1::DestinationType, null: true
    end
  end
end
