Rails.application.routes.draw do
  resources :responses, only: [:edit, :update], param: :slug
end
