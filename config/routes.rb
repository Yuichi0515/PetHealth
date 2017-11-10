Rails.application.routes.draw do
  resources :posts, :pets_info
  devise_for :users, controllers: { registrations: 'registrations' }
  root :to => "pages#index"
  resources :users, only: [:show] do
    member do
      get :message
    end
  end
  resources :photos, only: [:create, :destroy, :update] do
  	collection do
  		get :posting
  	end
  end
  resources :messages, only: [:create, :destroy] do
    member do
      get :recieve
    end
  end

  get 'messages/:flag' => 'messages#change_flag', as: 'change_flag'
  get 'new_message/:post_to' => 'messages#new', as: 'new_message'
  get 'manage_post/:id/basics' => 'posts#basics', as: 'manage_post_basics'
  get 'manage_post/:id/description' => 'posts#description', as: 'manage_post_description'
  get 'manage_post/:id/photos' => 'posts#photos', as: 'manage_post_photos'
end
