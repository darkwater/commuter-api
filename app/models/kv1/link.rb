class Kv1::Link < ApplicationRecord
  belongs_to :stop_begin,
    class_name: "Kv1::UserStopPoint",
    foreign_key: :user_stop_code_begin,
    primary_key: :user_stop_code

  belongs_to :stop_end,
    class_name: "Kv1::UserStopPoint",
    foreign_key: :user_stop_code_end,
    primary_key: :user_stop_code
end
