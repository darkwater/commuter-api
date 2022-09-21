    # create_table :kv1_destinations do |t|
    #   t.string :data_owner_code, limit: 10, null: false
    #   t.string :dest_code, limit: 10, null: false
    #   t.string :dest_name_full, limit: 50, null: false
    #   t.string :dest_name_main, limit: 24, null: false
    #   t.string :dest_name_detail, limit: 24
    #   t.boolean :relevant_dest_name_detail, null: false
    #   t.string :dest_name_main_21, limit: 21, null: false
    #   t.string :dest_name_detail_21, limit: 21
    #   t.string :dest_name_main_19, limit: 19, null: false
    #   t.string :dest_name_detail_19, limit: 19
    #   t.string :dest_name_main_16, limit: 16, null: false
    #   t.string :dest_name_detail_16, limit: 16
    #   t.integer :dest_icon
    #   t.string :dest_color, limit: 6
    #   t.string :dest_text_color, limit: 6

module Types
  module Kv1
    class DestinationType < Types::BaseObject
      description ""

      field :id, ID, null: false
      field :data_owner_code, String, null: false
      field :dest_code, String, null: false
      field :dest_name_full, String, null: false
      field :dest_name_main, String, null: false
      field :dest_name_detail, String, null: true
      field :relevant_dest_name_detail, Boolean, null: false
      field :dest_name_main_21, String, null: false
      field :dest_name_detail_21, String, null: true
      field :dest_name_main_19, String, null: false
      field :dest_name_detail_19, String, null: true
      field :dest_name_main_16, String, null: false
      field :dest_name_detail_16, String, null: true
      field :dest_color, String, null: true
      field :dest_text_color, String, null: true

      field :journey_pattern_timing_links, Types::Kv1::JourneyPatternTimingLinkType.connection_type, null: false
    end
  end
end
