class Kv1::OrgUnit < ApplicationRecord
  has_many :exceptional_operating_days,
    class_name: "Kv1::ExceptionalOperatingDay",
    foreign_key: :org_unit_code,
    primary_key: :org_unit_code

  has_many :period_group_validities,
    class_name: "Kv1::PeriodGroupValidity",
    foreign_key: :org_unit_code,
    primary_key: :org_unit_code

  has_many :timetable_versions,
    class_name: "Kv1::TimetableVersion",
    foreign_key: :org_unit_code,
    primary_key: :org_unit_code

  has_many :public_journeys,
    class_name: "Kv1::PublicJourney",
    foreign_key: :org_unit_code,
    primary_key: :org_unit_code
end
