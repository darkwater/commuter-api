module Types
  module Kv1
    class TimeDemandGroupType < Types::BaseObject
      description ""

      field :id, ID, null: false
      field :data_owner_code, String, null: false
      field :time_demand_group_code, String, null: false

      field :line, Types::Kv1::LineType, null: true
      field :journey_pattern, Types::Kv1::JourneyPatternType, null: true
      field :public_journeys, Types::Kv1::PublicJourneyType.connection_type, null: false
    end
  end
end
