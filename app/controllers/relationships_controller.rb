class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @relationship1 = Relationship.new(friend: params[:from], user_id: params[:to])
    @relationship2 = Relationship.new(friend: params[:to], user_id: params[:from])

    if @relationship1.save && @relationship2.save
      redirect_to relationship_path(current_user), notice: "承認しました。"
    else
      flash[:alert] = "承認できませんでした。"
    end

  end

  def destroy
  end

  def new
  end

  def show
    # フレンド
    @friend = Relationship.where(user_id: params[:id])
    @friend_user = User.none
    @friend.each{|frd|
      @user = User.where(id: frd.friend)
      @friend_user = @friend_user.or(@user)
    }

    # 申請中のフレンド
    @pre_friend_from_me = PreRelationship.where(user_id: params[:id])
    @pre_friend_from_me_user = User.none
    @pre_friend_from_me.each{|frd|
      @user = User.where(id: frd.friend)
      @pre_friend_from_me_user = @pre_friend_from_me_user.or(@user)
    }
     
    # 申請待ちのフレンド
    @pre_friend_from_someone = PreRelationship.where(friend: params[:id])
    @pre_friend_from_someone_user = User.none
    @pre_friend_from_someone.each{|frd|
      @user = User.where(id: frd.user_id)
      @pre_friend_from_someone_user = @pre_friend_from_someone_user.or(@user)
    }
  end
end