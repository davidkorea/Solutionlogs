Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :lognotes do
    collection do
      post :import
      get :search
    end
  end


  namespace :admin do
    resources :lognotes do
      collection do
        get :search
      end      
    end
    resources :importfiles

  end

  namespace :account do
    resources :lognotes
  end



  root 'lognotes#index'


end
