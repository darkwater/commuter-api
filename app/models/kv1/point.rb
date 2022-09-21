class Kv1::Point < ApplicationRecord
  has_many :point_on_link,
    class_name: "Kv1::PointOnLink",
    foreign_key: :point_code,
    primary_key: :point_code
end
