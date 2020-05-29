Rails.application.routes.draw do
  get 'posts/index'
  resources :places do
    resources :posts
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
