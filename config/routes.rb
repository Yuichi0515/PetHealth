Rails.application.routes.draw do
  resources :posts, :pets_info
  devise_for :users, controllers: { registrations: 'registrations' }
  root :to => "pages#index"
  resources :users, only: [:show]
  resources :photos, only: [:create, :destroy, :update] do
  	collection do
  		get :posting
  	end
  end

  get 'manage_post/:id/basics' => 'posts#basics', as: 'manage_post_basics'
  get 'manage_post/:id/description' => 'posts#description', as: 'manage_post_description'
  get 'manage_post/:id/photos' => 'posts#photos', as: 'manage_post_photos'
end
