class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
  end

  def new
    @post = current_user.posts.build
  end

  def create
    # パラメーターとともに現在のユーザーのポストを作成
    @post = current_user.posts.build(posts_params)

    if @post.save
      redirect_to edit_post_path(@post), notice: "投稿しました"
    else
      redirect_to new_post_path, notice: "投稿できませんでした"
    end
  end

  def edit
  end

  def update
  end

  private
  def posts_params
    params.require(:post).permit(:description, :weight, :food_requirement, :walk_time, :take_medicine)
  end
end
