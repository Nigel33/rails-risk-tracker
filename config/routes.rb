Rails.application.routes.draw do
  root to: "pages#index"

  resources :companies, only: [:show]
  resources :users, only: [:show] do  
  	get 'work_items', to: 'users#display_items'
    get 'completed_work_items', to: 'users#display_completed_items'
    resources :work_items, only: [] do 
      resources :reviews, only: [:show]
    end 
  end

  namespace :admin do 
    get '/dashboard', to: 'dashboard#index'
    resources :companies, only: [:new, :create]
    resources :work_items, only: [:new, :create, :show] do 
      resources :reviews, only: [:new, :create, :edit, :update]
    end 
    resources :users, only: [:show]
  end  

  resources :work_items, only: [:update, :show] do 
		namespace :niches do 
			resources :chemicals, only: [:index] 
      resources :manufacturings, only: [:index]
			
      namespace :chemicals do 
				resources :chemical_safety_features, only: [:new, :create, :edit, :update, :index]
        resources :chemical_equipments, only: [:new, :create, :edit, :update, :index]
        resources :chemical_properties, only: [:new, :create, :edit, :update, :index]
			end  

      namespace :manufacturings do 
        resources :manufacturing_safety_features, only: [:new, :create, :edit, :update, :index]
        resources :manufacturing_equipments, only: [:new, :create, :edit, :update, :index]
        resources :manufacturing_properties, only: [:new, :create, :edit, :update, :index]
      end  
		end 
	end 

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create" 
  post '/logout', to: "sessions#destroy"
end
