namespace :data do
  desc "weather data save"
  task :weatherDestroy => :environment do
    first = Openweather.first.id
    last = Openweather.last.id
    amount = last - first
    if amount >= 3000
        Openweahter.where(id: first..last-500).delete_all
    end
  end
end

namespace :weather do
  desc "weather data save"
  task :wakeUp => :environment do
    require 'net/http'
    uri = URI("https://koreaweather.herokuapp.com")
    Net::HTTP.get(uri)
  end
end