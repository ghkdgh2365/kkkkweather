    namespace :push do
      desc "push weather infomation"
      task :weather => :environment do
          @users = User.all
          @users.each do |u|
             unless (u.etc == nil or u.etc == "") and (u.alarm_time == nil or u.alarm_time == "")
                if u.alarm_time < Time.now + 300 and u.alarm_time > Time.now - 300
                    #do
                end
             end
          end

      end
    end