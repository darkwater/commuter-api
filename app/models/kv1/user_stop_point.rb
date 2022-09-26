class Kv1::UserStopPoint < ApplicationRecord
  belongs_to :stop_area,
    class_name: "Kv1::UserStopArea",
    foreign_key: :user_stop_area_code,
    primary_key: :user_stop_area_code

  has_many :timing_links_from,
    class_name: "Kv1::TimingLink",
    foreign_key: :user_stop_code_begin,
    primary_key: :user_stop_code

  has_many :timing_links_to,
    class_name: "Kv1::TimingLink",
    foreign_key: :user_stop_code_end,
    primary_key: :user_stop_code

  has_many :links_from,
    class_name: "Kv1::Link",
    foreign_key: :user_stop_code_begin,
    primary_key: :user_stop_code

  has_many :links_to,
    class_name: "Kv1::Link",
    foreign_key: :user_stop_code_end,
    primary_key: :user_stop_code

  has_many :journey_pattern_timing_links_from,
    class_name: "Kv1::JourneyPatternTimingLink",
    foreign_key: :user_stop_code_begin,
    primary_key: :user_stop_code

  has_many :journey_pattern_timing_links_to,
    class_name: "Kv1::JourneyPatternTimingLink",
    foreign_key: :user_stop_code_end,
    primary_key: :user_stop_code

  has_many :point_links_from,
    class_name: "Kv1::PointOnLink",
    foreign_key: :user_stop_code_begin,
    primary_key: :user_stop_code

  has_many :point_links_to,
    class_name: "Kv1::PointOnLink",
    foreign_key: :user_stop_code_end,
    primary_key: :user_stop_code

  def lines
      journey_pattern_timing_links_from.
        map(&:journey_pattern).
        map(&:line).
        uniq
  end
end
