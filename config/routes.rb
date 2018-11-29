Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'tests#index'

  devise_for :users,
    path: 'gurus',
    path_names: { sign_in: 'login', sign_out: 'logout' },
    controllers: { sessions: 'users/sessions' }

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :user_passed_tests, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  resources :feedbacks, only: %i[create new]

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
      patch :update_inline, on: :member
    end
    resources :gists, only: :index
  end
end
