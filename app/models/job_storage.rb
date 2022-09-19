class JobStorage < ApplicationRecord
  has_one_attached :data
end
