class Openweather < ApplicationRecord
    belongs_to :region
    serialize :temp,Array
    serialize :weather,Array
    serialize :description,Array
    serialize :icon,Array
    serialize :dt_txt,Array
end
