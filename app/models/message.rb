class Message < ApplicationRecord
  belongs_to :user
  belongs_to :post_to, class_name: "User"

  validates :message, presence: true
  validates :post_to_id, presence: true
end
