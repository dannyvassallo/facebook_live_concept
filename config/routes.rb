Rails.application.routes.draw do
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  get '/landing' => 'landing#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
