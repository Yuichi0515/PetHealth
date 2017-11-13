class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :pet_infos
  has_many :pet_infos
  has_many :messages
  has_many :relationships
  has_many :pre_relationships

  validates :email, presence: true
  validates :name, presence: true

  mount_uploader :avatar, AvatarUploader
end
