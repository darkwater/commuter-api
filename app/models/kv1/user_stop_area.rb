class Kv1::UserStopArea < ApplicationRecord
  has_many :stops,
    class_name: "Kv1::UserStopPoint",
    foreign_key: :user_stop_area_code,
    primary_key: :user_stop_area_code

  def lines
    stops.
      map(&:journey_pattern_timing_links_from).flatten.
      map(&:journey_pattern).
      map(&:line).
      uniq
  end
end
