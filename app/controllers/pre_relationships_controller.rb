class PreRelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
  	@pre_relationship = current_user.pre_relationships.build
  	@pre_relationship.friend = params[:id]
  	if PreRelationship.where(id: current_user.id).where(friend: params[:id]).present?
  		redirect_to root_path, alert: "すでに申請しています"
   	elsif @pre_relationship.save
  		redirect_to root_path, notice: "申請しました"
  	else
  		redirect_to root_path, alert: "申請に失敗しました"
  	end
  end

  def destroy
  	@pre_relationship = PreRelationship.where(friend: params[:from]).where(user_id: params[:to]).first
  	if @pre_relationship.destroy
  		render relationships_path, from: params[:from], to: params[:to]
  	else
  		flash[:alert] = "申請できませんでした。"
  	end
  end

  def new
  end

  def show
  end

  private
  def pre_relationship_params
  end
end