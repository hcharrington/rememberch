Rails.application.routes.draw do
  resources :pins
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
   root "pins#index"


  get "about" => "pages#about"


resources :pins do
  member do
    put "like", to: "pins#upvote"
    put "unlike", to: "pins#downvote"
  end
end
  
  
end
