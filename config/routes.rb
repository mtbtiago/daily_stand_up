Rails.application.routes.draw do
  resources :responses, param: :slug, only: [:show, :edit, :update]
end
