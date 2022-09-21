    # create_table :kv1_points do |t|
    #   t.string :data_owner_code, limit: 10, null: false
    #   t.string :point_code, limit: 10, null: false
    #   t.date :valid_from, null: false
    #   t.string :point_type, limit: 10, null: false
    #   t.integer :rd_x, null: false
    #   t.integer :rd_y, null: false
    #   t.integer :location_z
    #   t.string :description, limit: 255

module Types
  module Kv1
    class PointType < Types::BaseObject
      description ""

      field :id, ID, null: false
      field :data_owner_code, String, null: false
      field :point_code, String, null: false
      field :valid_from, String, null: false
      field :point_type, String, null: false
      field :rd_x, Integer, null: false
      field :rd_y, Integer, null: false
      field :location_z, Integer, null: true
      field :description, String, null: true

      field :point_on_links, Types::Kv1::PointOnLinkType.connection_type, null: false
    end
  end
end
