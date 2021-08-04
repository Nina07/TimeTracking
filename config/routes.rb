Rails.application.routes.draw do
  get 'timesheets/index'
  get 'timesheets/show'
  root "users#index"
  devise_for :users

  resources :users

  resources :timesheets, only: [:index, :show, :edit, :destroy]

  # get 'timesheets', to: "timesheets#index"
  post 'create_clock_in_entry', to: "timesheets#create_clock_in_entry"
  post 'create_clock_out_entry', to: "timesheets#create_clock_out_entry"
end
