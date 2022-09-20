class Kv1::UserStopPoint < ApplicationRecord
  belongs_to :stop_area,
    class_name: "Kv1::UserStopArea",
    foreign_key: :user_stop_area_code,
    primary_key: :user_stop_area_code
end
