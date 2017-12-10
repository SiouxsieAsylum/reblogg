Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root to: 'sessions#new'

resources :users, only: [:new, :create, :index, :show] do
  resources :followships, only:[:new, :create, :index, :destroy]
end

resource :session, only: [:new, :create, :destroy]

resources :posts

end
