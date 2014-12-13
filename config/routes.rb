Processes::Application.routes.draw do

  root 'trips#index'

  resources :trips, only: [:index, :new, :edit, :create, :update, :destroy] do
    resources :iterations, only: [:index, :edit, :update] do
      member do
        get :finished
        get :done
      end
    end
  end

end
