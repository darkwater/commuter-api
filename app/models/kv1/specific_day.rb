class Kv1::SpecificDay < ApplicationRecord
  has_many :timetable_versions,
    class_name: "Kv1::TimetableVersion",
    foreign_key: :specific_day_code,
    primary_key: :specific_day_code
end
