Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :lognotes do
    collection do
      post :import
    end
  end


  namespace :admin do
    resources :lognotes
    resources :importfiles
  end


  root 'lognotes#index'


end
