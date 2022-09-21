class Kv1::JourneyPattern < ApplicationRecord
  belongs_to :line,
    class_name: "Kv1::Line",
    foreign_key: :line_planning_number,
    primary_key: :line_planning_number

  has_many :journey_pattern_timing_links,
    class_name: "Kv1::JourneyPatternTimingLink",
    foreign_key: :journey_pattern_code,
    primary_key: :journey_pattern_code

  has_many :public_journeys,
    class_name: "Kv1::PublicJourney",
    foreign_key: :journey_pattern_code,
    primary_key: :journey_pattern_code
end
