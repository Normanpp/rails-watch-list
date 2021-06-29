Rails.application.routes.draw do
  root to: 'lists#index'
  resources :lists, except: %i[edit update] do
    resources :bookmarks, only: %i[new create]
  end
  resources :bookmarks, only: %i[destroy index show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
