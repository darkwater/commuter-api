class Kv1::TimeDemandGroup < ApplicationRecord
  belongs_to :line,
    class_name: "Kv1::Line",
    foreign_key: :line_planning_number,
    primary_key: :line_planning_number

  belongs_to :journey_pattern,
    class_name: "Kv1::JourneyPattern",
    foreign_key: :journey_pattern_code,
    primary_key: :journey_pattern_code

  has_many :public_journeys,
    class_name: "Kv1::PublicJourney",
    foreign_key: :time_demand_group_code,
    primary_key: :time_demand_group_code
end
