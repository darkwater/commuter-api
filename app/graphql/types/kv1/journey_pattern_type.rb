module Types
  module Kv1
    class JourneyPatternType < Types::BaseObject
      description ""

      field :id, ID, null: false
      field :data_owner_code, String, null: false
      field :journey_pattern_code, String, null: false
      field :journey_pattern_type, String, null: false
      field :direction, String, null: false
      field :description, String, null: true

      field :line, Types::Kv1::LineType, null: true
      field :journey_pattern_timing_links, Types::Kv1::JourneyPatternTimingLinkType.connection_type, null: false
      field :public_journeys, Types::Kv1::PublicJourneyType.connection_type, null: false
    end
  end
end
