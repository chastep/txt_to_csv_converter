Rails.application.routes.draw do
  root 'documents#new'

  resources :documents, only: [:new, :create]
end
