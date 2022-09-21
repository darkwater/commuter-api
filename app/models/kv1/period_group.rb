class Kv1::PeriodGroup < ApplicationRecord
  has_many :timetable_versions,
    class_name: "Kv1::TimetableVersion",
    foreign_key: :period_group_code,
    primary_key: :period_group_code

  has_many :validities,
    class_name: "Kv1::PeriodGroupValidity",
    foreign_key: :period_group_code,
    primary_key: :period_group_code
end
