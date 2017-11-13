class PagesController < ApplicationController
  def index
  	@users = User.all
  	if current_user.present?
  		@messages = Message.where(post_to_id: current_user.id)
  		@friends = Relationship.where(user_id: current_user.id)
  		friend_flag = false
  	end
  end
end