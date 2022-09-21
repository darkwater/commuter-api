class Kv1::PeriodGroupValidity < ApplicationRecord
  belongs_to :org_unit,
    class_name: "Kv1::OrgUnit",
    foreign_key: :org_unit_code,
    primary_key: :org_unit_code

  belongs_to :period_group,
    class_name: "Kv1::PeriodGroup",
    foreign_key: :period_group_code,
    primary_key: :period_group_code
end
