class Region < ApplicationRecord
    has_many :openweathers
    has_many :users
end
