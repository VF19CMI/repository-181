Rails.application.routes.draw do
  devise_for :users,
             only: [:omniauth_callbacks],
             controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :sequences do
    resources :entries

    member do
      get 'chart'
    end
  end

  resource :user do
    member do
      get 'logout'
    end
  end

  root "application#index"
  get '*path' => 'application#index'
end
