class Relationship < ApplicationRecord
  belongs_to :user

  validates :friend, presence: true
end
