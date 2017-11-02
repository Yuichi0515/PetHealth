class PetInfo < ApplicationRecord
  belongs_to :user

  validates :pet_type, presence: true
  validates :age, presence: true
  validates :sex, presence: true
  validates :name, presence: true
end
