Rails.application.routes.draw do
  resources :responses, param: :slug, only: %i[show edit update]
end
