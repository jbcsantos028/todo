class Task < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: { minimum: 4, maximum: 30 }
  validates :detail, presence: true, length: { minimum: 10, maximum: 300 }
  validates :due_date, presence: true
end
