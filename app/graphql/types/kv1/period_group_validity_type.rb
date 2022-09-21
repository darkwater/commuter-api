module Types
  module Kv1
    class PeriodGroupValidityType < Types::BaseObject
      description ""

      field :id, ID, null: false
      field :data_owner_code, String, null: false
      field :period_group_code, String, null: false
      field :valid_from, String, null: false
      field :valid_until, String, null: true

      field :org_unit, Types::Kv1::OrgUnitType, null: true
      field :period_group, Types::Kv1::PeriodGroupType, null: true
    end
  end
end
