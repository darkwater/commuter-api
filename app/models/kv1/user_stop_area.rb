class Kv1::UserStopArea < ApplicationRecord
  has_many :stops,
    class_name: "Kv1::UserStopPoint",
    foreign_key: :user_stop_area_code,
    primary_key: :user_stop_area_code
end
