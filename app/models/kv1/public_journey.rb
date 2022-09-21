class Kv1::PublicJourney < ApplicationRecord
  belongs_to :timetable_version,
    class_name: "Kv1::TimetableVersion",
    foreign_key: :timetable_version_code,
    primary_key: :timetable_version_code

  belongs_to :org_unit,
    class_name: "Kv1::OrgUnit",
    foreign_key: :org_unit_code,
    primary_key: :org_unit_code

  belongs_to :period_group,
    class_name: "Kv1::PeriodGroup",
    foreign_key: :period_group_code,
    primary_key: :period_group_code

  belongs_to :specific_day,
    class_name: "Kv1::SpecificDay",
    foreign_key: :specific_day_code,
    primary_key: :specific_day_code

  belongs_to :line,
    class_name: "Kv1::Line",
    foreign_key: :line_planning_number,
    primary_key: :line_planning_number

  belongs_to :time_demand_group,
    class_name: "Kv1::TimeDemandGroup",
    foreign_key: :time_demand_group_code,
    primary_key: :time_demand_group_code

  belongs_to :journey_pattern,
    class_name: "Kv1::JourneyPattern",
    foreign_key: :journey_pattern_code,
    primary_key: :journey_pattern_code
end
