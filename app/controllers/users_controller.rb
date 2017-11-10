class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id]) #Userモデルからuserを探してきた
  	@kanji = '漢字'
  	@pet_info = PetInfo.find(params[:id])
  end

  def message
  	@messages = Message.where("user_id=?", current_user.id).preload(:post_to) if signed_in?
  end
end