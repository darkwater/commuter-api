class Kv1::JourneyPatternTimingLink < ApplicationRecord
  belongs_to :line,
    class_name: "Kv1::Line",
    foreign_key: :line_planning_number,
    primary_key: :line_planning_number

  belongs_to :journey_pattern,
    class_name: "Kv1::JourneyPattern",
    foreign_key: :journey_pattern_code,
    primary_key: :journey_pattern_code

  belongs_to :stop_begin,
    class_name: "Kv1::UserStopPoint",
    foreign_key: :user_stop_code_begin,
    primary_key: :user_stop_code

  belongs_to :stop_end,
    class_name: "Kv1::UserStopPoint",
    foreign_key: :user_stop_code_end,
    primary_key: :user_stop_code

  belongs_to :destination,
    class_name: "Kv1::Destination",
    foreign_key: :dest_code,
    primary_key: :dest_code
end
