class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super
    # redirect_to :controller => 'pets_info', :action => 'new'
    session["#{resource_name}_return_to"] = new_pets_info_path
  end

  protected
  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end