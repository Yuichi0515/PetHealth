class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super
    session["#{resource_name}_return_to"] = new_pets_info_path
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      redirect_to user_path(current_user.id), notice: "保存が完了しました"
    else
      render edit_user_registration_path, notice: "保存できませんでした"
    end
  end

  protected
  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def user_params
    params.require(:user).permit(:description, :phone_number)
  end
end