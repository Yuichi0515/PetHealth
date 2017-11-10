class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
  	@message = current_user.messages.build(messages_params)
  	if @message.save
  		redirect_to message_user_path(current_user), notice: "送信しました"
  	else
  		redirect_to new_message_path, notice: "送信に失敗しました"
  	end
  end

  def destroy
  	
  end

  def recieve
  	@messages = Message.where(post_to_id: params[:id])
  end

  def new
  	@message = Message.new
  	@post_to = User.find(params[:post_to])
  end

  def change_flag
  	@message = Message.find(params[:flag])
  	@message.read_flag = true
  	@message.save
  end

  private
  def messages_params
    params.require(:message).permit(:post_to_id, :message, :title)
  end
end