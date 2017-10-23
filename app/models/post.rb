class Post < ApplicationRecord
  belongs_to :users

  validates :upload_date, presence: true
end
