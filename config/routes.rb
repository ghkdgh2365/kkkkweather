Rails.application.routes.draw do
  root 'home#weather'
  get 'home/index'
  get 'home/searchStationId'
  get 'home/weather'
  get 'home/arriveData'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
