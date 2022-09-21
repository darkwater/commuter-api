module Types
  module Kv1
    class PointOnLinkType < Types::BaseObject
      description ""

      field :id, ID, null: false
      field :data_owner_code, String, null: false
      field :link_valid_from, String, null: false
      field :distance, Integer, null: false
      field :segment_speed, Integer, null: true
      field :local_point_speed, Integer, null: true
      field :description, String, null: true
      field :transport_type, String, null: false

      field :stop_begin, Types::Kv1::UserStopPointType, null: false
      field :stop_end, Types::Kv1::UserStopPointType, null: false
      field :point, Types::Kv1::PointType, null: false
    end
  end
end
