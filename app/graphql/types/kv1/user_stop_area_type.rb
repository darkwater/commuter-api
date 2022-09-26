module Types
  module Kv1
    class UserStopAreaType < Types::BaseObject
      description "A bunch of related stops"

      field :id, ID, null: false
      field :data_owner_code, String, null: false
      field :user_stop_area_code, String, null: false
      field :name, String, null: false
      field :town, String, null: false
      field :road_side_eq_data_owner_code, String, null: true
      field :road_side_eq_unit_number, Integer, null: true
      field :description, String, null: true

      field :stops, Types::Kv1::UserStopPointType.connection_type, null: false
      field :lines, Types::Kv1::LineType.connection_type, null: false
    end
  end
end
