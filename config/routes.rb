Rails.application.routes.draw do
  root 'home#weather'
  get 'home/index'
  get 'home/searchStationId'
  get 'home/weather'
  get 'home/arriveData'
  get '/keyboard' => 'basic#keyboard_init'
  post '/message' => 'basic#chat_control'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
