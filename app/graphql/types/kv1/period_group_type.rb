module Types
  module Kv1
    class PeriodGroupType < Types::BaseObject
      description ""

      field :id, ID, null: false
      field :data_owner_code, String, null: false
      field :period_group_code, String, null: false
      field :description, String, null: true

      field :timetable_versions, Types::Kv1::TimetableVersionType.connection_type, null: false
      field :validities, Types::Kv1::PeriodGroupValidityType.connection_type, null: false
    end
  end
end
