Rails.application.routes.draw do

  root "lights#index"

  get "lights/command" => "lights#modes"
  get "lights/status" => "lights#checkStatus"

  resources :lights, :defaults => {:defaults => :json}
  # resources :clients, defaults: {format: :json}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
