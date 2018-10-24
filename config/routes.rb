Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'tests#index'

  resources :tests, shallow: true do
    resources :questions, except: :index do
      resources :answers, shallow: true, except: :index
    end
    
    member do
      post :start
    end
  end

  resources :user_passed_tests, only: %i[show update] do
    member do
      get :result
    end
  end
end
