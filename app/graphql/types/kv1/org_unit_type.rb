module Types
  module Kv1
    class OrgUnitType < Types::BaseObject
      description ""

      field :id, ID, null: false
      field :data_owner_code, String, null: false
      field :org_unit_code, String, null: false
      field :name, String, null: false
      field :org_unit_type, String, null: false
      field :description, String, null: true

      field :exceptional_operating_days, Types::Kv1::ExceptionalOperatingDayType.connection_type, null: false
      field :period_group_validities, Types::Kv1::PeriodGroupValidityType.connection_type, null: false
      field :timetable_versions, Types::Kv1::TimetableVersionType.connection_type, null: false
      field :public_journeys, Types::Kv1::PublicJourneyType.connection_type, null: false
    end
  end
end
