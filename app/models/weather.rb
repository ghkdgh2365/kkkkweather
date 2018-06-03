class Weather < ApplicationRecord
    serialize :w_time,Array
    serialize :w_temp,Array
    serialize :w_weather,Array
end
