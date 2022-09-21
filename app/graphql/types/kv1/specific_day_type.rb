module Types
  module Kv1
    class SpecificDayType < Types::BaseObject
      description ""

      field :id, ID, null: false
      field :data_owner_code, String, null: false
      field :specific_day_code, String, null: false
      field :name, String, null: false
      field :description, String, null: true

      field :timetable_versions, Types::Kv1::TimetableVersionType.connection_type, null: false
    end
  end
end
