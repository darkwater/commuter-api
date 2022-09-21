class Kv1::TimetableVersion < ApplicationRecord
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
end
