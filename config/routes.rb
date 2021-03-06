Rails.application.routes.draw do
  resources :interviews
  resources :boards
  resources :posts
  root 'home#weather'
  get 'home/index'
  get 'home/searchStationId'
  get 'home/weather'
  get 'home/arriveData'
  get '/keyboard' => 'basic#keyboard_init'
  post '/message' => 'basic#chat_control'
  get 'home/todayWeather/:city1' => 'home#todayWeather'
  get 'home/testWeather/:city1/:region_id' => 'home#testWeather'
  get 'home/testWeather/:city1' => 'home#testWeather'
  get 'home/tomorrowWeather/:city1/:region_id' => 'home#tomorrowWeather'
  get 'home/tomorrowWeather/:city1' => 'home#tomorrowWeather'
  get 'home/welcome'
  get 'home/welcome2'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
