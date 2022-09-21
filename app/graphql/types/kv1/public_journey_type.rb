module Types
  module Kv1
    class PublicJourneyType < Types::BaseObject
      description ""

      field :id, ID, null: false
      field :data_owner_code, String, null: false
      field :day_type, String, null: false
      field :line_planning_number, String, null: false
      field :journey_number, Integer, null: false
      field :departure_time, String, null: false
      field :wheelchair_accessible, Boolean, null: false
      field :data_owner_is_operator, Boolean, null: false
      field :planned_monitored, Boolean, null: false
      field :product_formula_type, Integer, null: false

      field :timetable_version, Types::Kv1::TimetableVersionType, null: false
      field :org_unit, Types::Kv1::OrgUnitType, null: false
      field :period_group, Types::Kv1::PeriodGroupType, null: false
      field :specific_day, Types::Kv1::SpecificDayType, null: false
      field :line, Types::Kv1::LineType, null: false
      field :time_demand_group, Types::Kv1::TimeDemandGroupType, null: false
      field :journey_pattern, Types::Kv1::JourneyPatternType, null: false
    end
  end
end
