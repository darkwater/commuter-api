module Types
  module Kv1
    class TimetableVersionType < Types::BaseObject
      description ""

      field :id, ID, null: false
      field :data_owner_code, String, null: false
      field :timetable_version_code, String, null: false
      field :timetable_version_type, String, null: false
      field :valid_from, String, null: false
      field :valid_until, String, null: true
      field :description, String, null: true

      field :org_unit, Types::Kv1::OrgUnitType, null: true
      field :period_group, Types::Kv1::PeriodGroupType, null: true
      field :specific_day, Types::Kv1::SpecificDayType, null: true
    end
  end
end
