    # create_table :kv1_links do |t|
    #   t.string :data_owner_code, limit: 10, null: false
    #   t.string :user_stop_code_begin, limit: 10, null: false
    #   t.string :user_stop_code_end, limit: 10, null: false
    #   t.date :valid_from, null: false
    #   t.integer :distance, null: false
    #   t.string :description, limit: 255
    #   t.string :transport_type, limit: 5, null: false

module Types
  module Kv1
    class LinkType < Types::BaseObject
      description ""

      field :id, ID, null: false
      field :data_owner_code, String, null: false
      field :valid_from, String, null: false
      field :distance, Integer, null: false
      field :description, String, null: true
      field :transport_type, String, null: false

      field :stop_begin, Types::Kv1::UserStopPointType, null: false
      field :stop_end, Types::Kv1::UserStopPointType, null: false
    end
  end
end
