XApp::Application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :boards
    end
  end
  devise_for :users
  resources :boards do
    collection  do
      get :search
    end
  end
  root to: "tickets#index"
end
