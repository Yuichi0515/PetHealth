class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id]) #Userモデルからuserを探してきた
  	@kanji = '漢字'
  end
end