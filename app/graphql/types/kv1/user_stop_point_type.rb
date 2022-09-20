module Types
  module Kv1
    class UserStopPointType < Types::BaseObject
      description "A stop point"

      field :id, ID, null: false
      field :code, String, null: false
      field :data_owner_code, String, null: false
      field :timing_point_code, String, null: true
      field :get_in, Boolean, null: false
      field :get_out, Boolean, null: false
      field :name, String, null: false
      field :town, String, null: false
      field :stop_side_code, String, null: true
      field :road_side_eq_data_owner_code, String, null: true
      field :road_side_eq_unit_number, Integer, null: true
      field :minimal_stop_time, Integer, null: false
      field :stop_side_length, Integer, null: true
      field :description, String, null: true
      field :user_stop_type, String, null: false

      field :stop_area, [Types::Kv1::UserStopAreaType], null: false
    end
  end
end
