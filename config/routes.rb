Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  root to: 'pages#home'
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  resources :portfolios, except: [:show]
    get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
    get 'portfolios/angular', to: 'portfolios#angular'
    get 'portfolios/ruby_on_rails', to: 'portfolios#ruby_on_rails'
    
  resources :blogs

  resources :blogs do
    member do
      post :toggle_status
    end
  end
end
