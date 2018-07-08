require 'csv'
namespace :csv do
    task :region => :environment do
        CSV.foreach('region.csv', :headers => true , :encoding => 'euc-kr') do |row|
          Region.create!(row.to_hash)
        end
    end
end