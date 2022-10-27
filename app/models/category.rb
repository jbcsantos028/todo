class Category < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  validates :title, presence: true, uniqueness: { scope: :user, case_sensitive: false }, length: { minimum: 3, maximum: 25 }
end
