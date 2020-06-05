Rails.application.routes.draw do
  root to: 'areas#index'
  # resources :areas do
  #   resources :countries, only: [:new, :create]
  # end
  # resources :countries, except: [:new, :create] do
  #   resources :places do
  #     resources :posts
  #   end
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :areas
  resources :countries do
    resources :places do
      resources :posts
    end
  end


end
