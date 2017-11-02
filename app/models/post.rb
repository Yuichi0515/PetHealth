class Post < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy

  validates :description, presence: true
end
