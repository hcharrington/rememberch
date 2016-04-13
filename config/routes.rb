Rails.application.routes.draw do
  resources :pins
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
   root "pins#index"


  get "about" => "pages#about"

  
end
