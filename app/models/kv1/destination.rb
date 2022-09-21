class Kv1::Destination < ApplicationRecord
  has_many :journey_pattern_timing_links,
    class_name: "Kv1::JourneyPatternTimingLink",
    foreign_key: :dest_code,
    primary_key: :dest_code
end
