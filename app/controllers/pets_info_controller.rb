class PetsInfoController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pet_info, only: [:edit, :update]

  def index
  end

  def show
  end

  def new
  	@pet_info = current_user.pet_infos.build
  end

  def create
  	#formのデータを受け取る
    @pet_info = current_user.pet_infos.build(pet_info_params)
    #saveメソッドでデータをセーブ　*newメソッド + saveメソッド = createメソッド
    if @pet_info.save
      #saveが完了したら、一覧ページへリダイレクト
      redirect_to user_path(current_user.id), notice: "保存が完了しました"
    else
      #saveを失敗すると新規作成ページへ
	     render new_pets_info_path, notice: "保存できませんでした"
    end
  end

  def edit
  end

  def update
    if @pet_info.update_attributes(pet_info_params)
      redirect_to user_path(current_user.id), notice: "保存が完了しました"
    else
      render edit_pets_info_path, notice: "保存できませんでした"
    end
  end

  private
  def pet_info_params
    params.require(:pet_info).permit(:pet_type, :age, :sex, :name)
  end

  def set_pet_info
    @pet_info = PetInfo.find(params[:id])
  end
end
