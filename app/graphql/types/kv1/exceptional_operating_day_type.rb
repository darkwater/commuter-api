module Types
  module Kv1
    class ExceptionalOperatingDayType < Types::BaseObject
      description ""

      field :id, ID, null: false
      field :data_owner_code, String, null: false
      field :valid_date, String, null: false
      field :day_type_as_on, String, null: false
      field :description, String, null: true

      field :org_unit, Types::Kv1::OrgUnitType, null: true
      field :specific_day, Types::Kv1::SpecificDayType, null: true
      field :period_group, Types::Kv1::PeriodGroupType, null: true
    end
  end
end
