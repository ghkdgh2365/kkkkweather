    namespace :data do
      desc "weather data save"
      task :weatherSave => :environment do
        require 'nokogiri'
        require 'open-uri'
        @time = Array.new
        @temp = Array.new
        @weather = Array.new
        @now_temp = Array.new
        @weather_size = 0
        @timeX = 0
        @tempX = 0
        @weatherX = 0
        # 기상청 홈페이지 열기
        doc = Nokogiri::HTML(open("http://m.kma.go.kr"))
        
        # 시간 뽑기(내일까지만)
        doc.css(".w-item-hr").each do |x|
          if @timeX < 10
            @time << x.inner_text if x.inner_text.include?("시")
            @timeX += 1
          end
        end
        @time.delete_at(3)#중복값 제거
        # 온도 뽑기(내일까지만)
        doc.css(".w-item li").each do |x|
          if x.inner_text.include?("℃") 
            unless x.inner_text.include?("최저") || x.inner_text.include?("/")
              if @tempX < 10
                @temp << x.inner_text
                @tempX += 1
              end
            end
          end
        end
        @temp.delete_at(3)
        # 날씨 뽑기
        doc.css(".w-item li:nth-child(5)").each do |x|
          if @weatherX < 10
            # if @weather_size <= @temp.size
              @weather << x.inner_text
              # @weather_size += 1
            # end
            @weatherX += 1
          end
        end
        @weather.delete_at(3)
        # 현재 날씨
        doc.css(".inf > p").each do |x|
          @now_temp << x.inner_text if x.inner_text.include?("℃") 
        end
        @now_temp = @now_temp.pop
        @todayweather = Weather.new
        @todayweather.w_time = @time
        @todayweather.w_temp = @temp
        @todayweather.w_weather = @weather
        @todayweather.save
        
        @mises = [] #미세먼지, 오존 정보 담을 통
        air = Nokogiri::HTML(open("https://www.airkorea.or.kr/dustForecast")) #에어코리아 크롤링
        
        # 미세,오존 정보 뽑기
        air.css(".inform_overall").each do |x|
          @mises << x.inner_text
        end
        
        @mise = Mise.new
        @mise.mise_info = @mises[0] #미세먼지 오늘꺼
        @mise.ozone_info = @mises[2] #오존 오늘꺼
        @mise.save
      end
    
    end
    
    namespace :data do
      desc "weather0 data save"
      task :save0 => :environment do
        require 'nokogiri'
        require 'open-uri'
        @temp = Array.new
        @weather = Array.new
        @i = 0
        # 서울 페이지
        for @i in 0..3
          doc = Nokogiri::HTML(open("http://m.kma.go.kr/m/forecast/forecast_01.jsp?area=0&zone=#{@i}"))
          # 날씨 뽑기
          doc.css('tr > td:nth-child(2) > img').each do |x|
          	@weather << x['alt']
          end
          @weather = @weather[0..14] #7 제거
          # 온도 뽑기(내일까지만)
          doc.css('tr > td:nth-child(3) > p > span').each do |x|
          	@temp << x.inner_text 
          end
          @temp = @temp[1..16]#8제거
          @temp.delete_at(8)
          @todayweather = Weather.new
          case @i
          when 0
            @todayweather.region_name = "서울"
            @todayweather.check_value = 0
          when 1
            @todayweather.region_name = "수원"
            @todayweather.check_value = 1
          when 2
            @todayweather.region_name = "인천"
            @todayweather.check_value = 2
          when 3
            @todayweather.region_name = "파주"
            @todayweather.check_value = 3
          else
          end
          @todayweather.w_temp = @temp
          @todayweather.w_weather = @weather
          @todayweather.save
        end
        
        @temp = Array.new
        @weather = Array.new
        @i = 0
        # 서울 페이지
        for @i in 0..2
          doc = Nokogiri::HTML(open("http://m.kma.go.kr/m/forecast/forecast_01.jsp?area=1&zone=#{@i}"))
          # 날씨 뽑기
          doc.css('tr > td:nth-child(2) > img').each do |x|
          	@weather << x['alt']
          end
          @weather = @weather[0..14] #7 제거
          # 온도 뽑기(내일까지만)
          doc.css('tr > td:nth-child(3) > p > span').each do |x|
          	@temp << x.inner_text 
          end
          @temp = @temp[1..16]#8제거
          @temp.delete_at(8)
          @todayweather = Weather.new
          case @i
          when 0
            @todayweather.region_name = "강릉"
            @todayweather.check_value = 4
          when 1
            @todayweather.region_name = "원주"
            @todayweather.check_value = 5
          when 2
            @todayweather.region_name = "춘천"
            @todayweather.check_value = 6
          else
          end
          @todayweather.w_temp = @temp
          @todayweather.w_weather = @weather
          @todayweather.save
        end
        
        @temp = Array.new
        @weather = Array.new
        @i = 0
        # 서울 페이지
        for @i in 0..3
          doc = Nokogiri::HTML(open("http://m.kma.go.kr/m/forecast/forecast_01.jsp?area=2&zone=#{@i}"))
          # 날씨 뽑기
          doc.css('tr > td:nth-child(2) > img').each do |x|
          	@weather << x['alt']
          end
          @weather = @weather[0..14] #7 제거
          # 온도 뽑기(내일까지만)
          doc.css('tr > td:nth-child(3) > p > span').each do |x|
          	@temp << x.inner_text 
          end
          @temp = @temp[1..16]#8제거
          @temp.delete_at(8)
          @todayweather = Weather.new
          case @i
          when 0
            @todayweather.region_name = "대전"
            @todayweather.check_value = 7
          when 1
            @todayweather.region_name = "홍성"
            @todayweather.check_value = 8
          when 2
            @todayweather.region_name = "세종"
            @todayweather.check_value = 9
          when 3
            @todayweather.region_name = "청주"
            @todayweather.check_value = 10
          else
          end
          @todayweather.w_temp = @temp
          @todayweather.w_weather = @weather
          @todayweather.save
        end
        
        @temp = Array.new
        @weather = Array.new
        @i = 0
        # 서울 페이지
        for @i in 0..4
          doc = Nokogiri::HTML(open("http://m.kma.go.kr/m/forecast/forecast_01.jsp?area=3&zone=#{@i}"))
          # 날씨 뽑기
          doc.css('tr > td:nth-child(2) > img').each do |x|
          	@weather << x['alt']
          end
          @weather = @weather[0..14] #7 제거
          # 온도 뽑기(내일까지만)
          doc.css('tr > td:nth-child(3) > p > span').each do |x|
          	@temp << x.inner_text 
          end
          @temp = @temp[1..16]#8제거
          @temp.delete_at(8)
          @todayweather = Weather.new
          case @i
          when 0
            @todayweather.region_name = "군산"
            @todayweather.check_value = 11
          when 1
            @todayweather.region_name = "광주"
            @todayweather.check_value = 12
          when 2
            @todayweather.region_name = "목포"
            @todayweather.check_value = 13
          when 3
            @todayweather.region_name = "여수"
            @todayweather.check_value = 14
          when 4
            @todayweather.region_name = "전주"
            @todayweather.check_value = 15
          else
          end
          @todayweather.w_temp = @temp
          @todayweather.w_weather = @weather
          @todayweather.save
        end
        
        @temp = Array.new
        @weather = Array.new
        @i = 0
        # 서울 페이지
        for @i in 0..5
          doc = Nokogiri::HTML(open("http://m.kma.go.kr/m/forecast/forecast_01.jsp?area=4&zone=#{@i}"))
           # 날씨 뽑기
          doc.css('tr > td:nth-child(2) > img').each do |x|
          	@weather << x['alt']
          end
          @weather = @weather[0..14] #7 제거
          # 온도 뽑기(내일까지만)
          doc.css('tr > td:nth-child(3) > p > span').each do |x|
          	@temp << x.inner_text 
          end
          @temp = @temp[1..16]#8제거
          @temp.delete_at(8)
          @todayweather = Weather.new
          case @i
          when 0
            @todayweather.region_name = "대구"
            @todayweather.check_value = 16
          when 1
            @todayweather.region_name = "부산"
            @todayweather.check_value = 17
          when 2
            @todayweather.region_name = "안동"
            @todayweather.check_value = 18
          when 3
            @todayweather.region_name = "울산"
            @todayweather.check_value = 19
          when 4
            @todayweather.region_name = "창원"
            @todayweather.check_value = 20
          when 5
            @todayweather.region_name = "포항"
            @todayweather.check_value = 21
          else
          end
          @todayweather.w_temp = @temp
          @todayweather.w_weather = @weather
          @todayweather.save
        end
        
        @temp = Array.new
        @weather = Array.new
        @i = 0
        # 서울 페이지
        for @i in 0..1
          doc = Nokogiri::HTML(open("http://m.kma.go.kr/m/forecast/forecast_01.jsp?area=5&zone=#{@i}"))
          # 날씨 뽑기
          doc.css('tr > td:nth-child(2) > img').each do |x|
          	@weather << x['alt']
          end
          @weather = @weather[0..14] #7 제거
          # 온도 뽑기(내일까지만)
          doc.css('tr > td:nth-child(3) > p > span').each do |x|
          	@temp << x.inner_text 
          end
          @temp = @temp[1..16]#8제거
          @temp.delete_at(8)
          @todayweather = Weather.new
          case @i
          when 0
            @todayweather.region_name = "서귀포"
            @todayweather.check_value = 22
          when 1
            @todayweather.region_name = "제주"
            @todayweather.check_value = 23
          else
          end
          @todayweather.w_temp = @temp
          @todayweather.w_weather = @weather
          @todayweather.save
        end
      end
    
    end