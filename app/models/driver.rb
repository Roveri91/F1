class Driver < ApplicationRecord
  validates :driver_id, presence: true, uniqueness: true
end
