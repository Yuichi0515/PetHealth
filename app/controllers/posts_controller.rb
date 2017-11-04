class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:basics, :description, :photos]

  def index
  end

  def show
    @posts = current_user.posts.all
  end

  def new
    @post = Post.new
  end

  def create
    # パラメーターとともに現在のユーザーのポストを作成
    @post = current_user.posts.build(posts_params)

    if @post.save
      redirect_to manage_post_photos_path(@post), notice: "投稿しました"
    else
      redirect_to new_post_path, notice: "投稿できませんでした"
    end
  end

  def edit
  end

  def update
  end

  def bascis
  end

  def description
  end

  def photos
    @photo = Photo.new
  end

  private
  def posts_params
    params.require(:post).permit(:description, :weight, :food_requirement, :walk_time, :take_medicine)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
