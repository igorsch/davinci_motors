Rails.application.routes.draw do
  root 'cars#index'

  resources :cars do
    member do 
      get 'claim' => 'cars#claim'
      get 'unclaim' => 'cars#unclaim'
      # get 'wash' => 'cars#wash'
    end
    
    collection do
      #... action to do on all cars
    end
  end

  get 'mycars' => 'cars#mycars'
  
  resources :users,
    only: [:create, :new],
    path_names: { new: 'signup'}

  get 'login' => 'sessions#login'
  post 'login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'
end
