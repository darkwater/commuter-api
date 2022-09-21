    # create_table :kv1_timing_links do |t|
    #   t.string :data_owner_code, limit: 10, null: false
    #   t.string :user_stop_code_begin, limit: 10, null: false
    #   t.string :user_stop_code_end, limit: 10, null: false
    #   t.integer :minimal_drive_time
    #   t.string :description, limit: 255

module Types
  module Kv1
    class TimingLinkType < Types::BaseObject
      description ""

      field :id, ID, null: false
      field :data_owner_code, String, null: false
      field :minimal_drive_time, Integer, null: true
      field :description, String, null: true

      field :stop_begin, Types::Kv1::UserStopPointType, null: false
      field :stop_end, Types::Kv1::UserStopPointType, null: false
    end
  end
end
