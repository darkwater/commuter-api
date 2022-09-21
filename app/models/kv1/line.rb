class Kv1::Line < ApplicationRecord
  has_many :journey_patterns,
    class_name: "Kv1::JourneyPattern",
    foreign_key: :line_planning_number,
    primary_key: :line_planning_number

  has_many :journey_pattern_timing_links,
    class_name: "Kv1::JourneyPatternTimingLink",
    foreign_key: :line_planning_number,
    primary_key: :line_planning_number
end
