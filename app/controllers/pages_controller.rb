class PagesController < ApplicationController
  def index
  	@users = User.all
  	@messages = Message.where(post_to_id: current_user.id)
  end
end