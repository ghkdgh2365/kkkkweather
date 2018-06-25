class BasicController < ApplicationController
    skip_before_action :verify_authenticity_token
    def keyboard_init
        @msg =
            {
              type: "buttons",
              buttons: ["오늘 날씨 보기", "지역 등록 하기", "다른 지역 날씨"] # ,"알림 시간 등록"
            }
        render json: @msg, status: :ok
    end
    # def chat_control
    #     @response = params[:content]
    #     @user_key = params[:user_key]
    #     @type = params[:type]
    #     @rain_news = ""
    #     Weather.last.w_weather.each do |x|
    #         if x == "비"
    #             @rain_news = "(비)비 소식이 있어요 :)"
    #         end
    #     end
    #     @msg = {
    #       message: {
    #           text: "안녕하세요-! 날씨날씨입니당 :) 오늘 최저 기온은 #{Weather.last.w_temp.sort.first},           최고 기온은 #{Weather.last.w_temp.sort.last}입니당       #{@rain_news}" ,
    #           message_button: {
    #             label: "자세한 날씨 보기",
    #             url: "https://koreaweather.herokuapp.com/"
    #           }
    #       },
    #       keyboard: {
    #         type: "buttons",
    #         buttons: ["오늘 날씨 보기"]
    #       }
    #     }
    #     render json: @msg, status: :ok
    # end
    def chat_control
        @response = params[:content]
        @user_key = params[:user_key]
        @type = params[:type]
        @rain_news = ""
        # user 있으면 user 정보 받아오고 비 소식도 같이 받아옴
        if User.where(user_key: @user_key).exists?
          @user = User.where(user_key: @user_key).last
          Weather.where(check_value: @user.etc).last.w_weather[0..6].each do |x|
              if x == "비"
                  @rain_news = "(비)비 소식이 있어요 :)"
              end
          end
        end
        
        if @response == "오늘 날씨 보기"
          if User.where(user_key: @user_key).exists?
            @msg = {
              message: {
                  text: "안녕하세요-! 날씨날씨입니당 :) 오늘 #{Weather.where(check_value: @user.etc).last.region_name}  최저 기온은 #{Weather.where(check_value: @user.etc).last.w_temp[0..6].sort.first},           최고 기온은 #{Weather.where(check_value: @user.etc).last.w_temp[0..6].sort.last}입니당       #{@rain_news}" ,
                  message_button: {
                    label: "자세한 날씨 보기",
                    url: "https://koreaweather.herokuapp.com/home/todayWeather/#{@user.etc}"
                  }
              },
              keyboard: {
                type: "buttons",
                buttons: ["오늘 날씨 보기", "지역 다시 등록", "다른 지역 날씨"] # ,"알림 시간 등록"
              }
            }
          else
            @msg = {
              message: {
                  text: "안녕하세요-! 날씨날씨입니당 :) 지역을 등록해주세요-!"
              },
              keyboard: {
                type: "buttons",
                buttons: ["지역 등록 하기"]
              }
            }
          end
          
          render json: @msg, status: :ok
        end
        if @response == "지역 등록 하기" or @response == "지역 다시 등록"
            @msg = {
              message: {
                  text: "지역을 선택해주세요 :)"
              },
              keyboard: {
                type: "buttons",
                buttons: ["서울", "수원", "파주", "인천", "강릉", "원주", "춘천", "대전", "홍성", "세종", "청주", "군산", "광주", "목포", "여수", "전주", "대구", "부산", "안동", "울산", "창원", "포항", "서귀포", "제주"]
              }
            }
            # 
            render json: @msg, status: :ok
        end
        if @response == "서울" or @response == "수원" or @response == "파주" or @response == "인천" or @response == "강릉" or @response == "원주" or @response == "춘천" or @response == "대전" or @response == "홍성" or @response == "세종" or @response == "청주" or @response == "군산" or @response == "광주" or @response == "목포" or @response == "여수" or @response == "전주" or @response == "대구" or @response == "부산" or @response == "안동" or @response == "울산" or @response == "창원" or @response == "포항" or @response == "서귀포" or @response == "제주"
            # 
            if @user_key == "" or @user_key == nil
              @user = User.new
              @user.user_key = @user_key
              @user.region = @response
            else
              @user = User.where(user_key: @user_key).last
              @user.region = @response
            end
            case @response
            when "서울"
              @user.etc = 0
            when "수원"
              @user.etc = 1
            when "파주"
              @user.etc = 2
            when "인천"
              @user.etc = 3
            when "강릉"
              @user.etc = 4
            when "원주"
              @user.etc = 5
            when "춘천"
              @user.etc = 6
            when "대전"
              @user.etc = 7
            when "홍성"
              @user.etc = 8
            when "세종"
              @user.etc = 9
            when "청주"
              @user.etc = 10
            when "군산"
              @user.etc = 11
            when "광주"
              @user.etc = 12
            when "목포"
              @user.etc = 13
            when "여수"
              @user.etc = 14
            when "전주"
              @user.etc = 15
            when "대구"
              @user.etc = 16
            when "부산"
              @user.etc = 17
            when "안동"
              @user.etc = 18
            when "울산"
              @user.etc = 19
            when "창원"
              @user.etc = 20
            when "포항"
              @user.etc = 21
            when "서귀포"
              @user.etc = 22
            when "제주"
              @user.etc = 23
            else
            end
            @user.save
            
            @msg = {
              message: {
                  text: "#{@response}지역으로 등록되었습니다-!"
              },
              keyboard: {
                type: "buttons",
                buttons: ["오늘 날씨 보기", "지역 다시 등록", "다른 지역 날씨"]# ,"알림 시간 등록"
              }
            }
            render json: @msg, status: :ok
        end
        if @response == "다른 지역 날씨"
            @msg = {
              message: {
                  text: "원하시는 지역 버튼을 눌러주세요-!"
              },
              keyboard: {
                type: "buttons",
                buttons: ["서울 날씨 보기", "수원 날씨 보기", "파주 날씨 보기", "인천 날씨 보기", "강릉 날씨 보기", "원주 날씨 보기", "춘천 날씨 보기", "대전 날씨 보기", "홍성 날씨 보기", "세종 날씨 보기", "청주 날씨 보기", "군산 날씨 보기", "광주 날씨 보기", "목포 날씨 보기", "여수 날씨 보기", "전주 날씨 보기", "대구 날씨 보기", "부산 날씨 보기", "안동 날씨 보기", "울산 날씨 보기", "창원 날씨 보기", "포항 날씨 보기", "서귀포 날씨 보기", "제주 날씨 보기"]
              }
            }
            render json: @msg, status: :ok
            # , 
        end
        if @response == "서울 날씨 보기" or @response == "수원 날씨 보기" or @response == "파주 날씨 보기" or @response == "인천 날씨 보기" or @response == "강릉 날씨 보기" or @response == "원주 날씨 보기" or @response == "춘천 날씨 보기"or @response == "대전 날씨 보기" or @response == "홍성 날씨 보기" or @response == "세종 날씨 보기" or @response == "청주 날씨 보기" or @response == "군산 날씨 보기" or @response == "광주 날씨 보기" or @response == "목포 날씨 보기" or @response == "여수 날씨 보기" or @response == "전주 날씨 보기" or @response == "대구 날씨 보기" or @response == "부산 날씨 보기" or @response == "안동 날씨 보기" or @response == "울산 날씨 보기" or @response == "창원 날씨 보기" or @response == "포항 날씨 보기" or @response == "서귀포 날씨 보기" or @response == "제주 날씨 보기"
          #  
          case @response
          when "서울 날씨 보기"
            @region = 0
          when "수원 날씨 보기"
            @region = 1
          when "파주 날씨 보기"
            @region = 2
          when "인천 날씨 보기"
            @region = 3
          when "강릉 날씨 보기"
            @region = 4
          when "원주 날씨 보기"
            @region = 5
          when "춘천 날씨 보기"
            @region = 6
          when "대전 날씨 보기"
            @region = 7
          when "홍성 날씨 보기"
            @region = 8
          when "세종 날씨 보기"
            @region = 9
          when "청주 날씨 보기"
            @region = 10
          when "군산 날씨 보기"
            @region = 11
          when "광주 날씨 보기"
            @region = 12
          when "목포 날씨 보기"
            @region = 13
          when "여수 날씨 보기"
            @region = 14
          when "전주 날씨 보기"
            @region = 15
          when "대구 날씨 보기"
            @region = 16
          when "부산 날씨 보기"
            @region = 17
          when "안동 날씨 보기"
            @region = 18
          when "울산 날씨 보기"
            @region = 19
          when "창원 날씨 보기"
            @region = 20
          when "포항 날씨 보기"
            @region = 21
          when "서귀포 날씨 보기"
            @region = 22
          when "제주 날씨 보기"
            @region = 23
          else
          end
          Weather.where(check_value: @region).last.w_weather[0..6].each do |x|
              if x == "비"
                  @rain_news = "(비)비 소식이 있어요 :)"
              end
          end
          @msg = {
              message: {
                  text: "안녕하세요-! 날씨날씨입니당 :) 오늘 #{Weather.where(check_value: @region).last.region_name} 최저 기온은 #{Weather.where(check_value: @region).last.w_temp[0..6].sort.first},           최고 기온은 #{Weather.where(check_value: @region).last.w_temp[0..6].sort.last}입니당       #{@rain_news}" ,
                  message_button: {
                    label: "자세한 날씨 보기",
                    url: "https://koreaweather.herokuapp.com/home/todayWeather/#{@region}"
                  }
              },
              keyboard: {
                type: "buttons",
                buttons: ["오늘 날씨 보기", "지역 등록 하기", "다른 지역 날씨"] # ,"알림 시간 등록"
              }
            }
            render json: @msg, status: :ok
        end
        # if @response == "알림 시간 등록" 
        #     @msg = {
        #       message: {
        #           text: "알림받을 시간을 선택해주세요 :)"
        #       },
        #       keyboard: {
        #         type: "buttons",
        #         buttons: ["06:00", "06:30", "07:00", "07:30", "08:00", "08:30", "09:00", "09:30", "10:00", "10:30", "11:00", "11:30", "12:00"]
        #       }
        #     }
        #     render json: @msg, status: :ok
        # end
        # if @response == "06:00" or @response == "06:30" or @response == "07:00" or @response == "07:30" or @response == "08:00" or @response == "08:30" or @response == "09:00" or @response == "09:30" or @response == "10:00" or @response == "10:30" or @response == "11:00" or @response == "11:30" or @response == "12:00" or @response == "목포" or @response == "여수" or @response == "전주" or @response == "대구" or @response == "부산" or @response == "안동" or @response == "울산" or @response == "창원" or @response == "포항" or @response == "서귀포" or @response == "제주"
        #     # 
        #     if @user_key == "" or @user_key == nil
        #       @user = User.new
        #       @user.user_key = @user_key
        #       @user.region = @response
        #     else
        #       @user = User.where(user_key: @user_key).last
        #       @user.region = @response
        #     end
        #     case @response
        #     when "06:00"
        #       @user.alarm_time = "06:00"
        #     when "06:30"
        #       @user.alarm_time = "06:30"
        #     when "07:00"
        #       @user.alarm_time = "07:00"
        #     when "07:30"
        #       @user.alarm_time = "07:30"
        #     when "08:00"
        #       @user.alarm_time = "08:00"
        #     when "08:30"
        #       @user.alarm_time = "08:30"
        #     when "09:00"
        #       @user.alarm_time = "09:00"
        #     when "09:30"
        #       @user.alarm_time = "09:30"
        #     when "10:00"
        #       @user.alarm_time = "10:00"
        #     when "10:30"
        #       @user.alarm_time = "10:30"
        #     when "11:00"
        #       @user.alarm_time = "11:00"
        #     when "11:30"
        #       @user.alarm_time = "11:30"
        #     when "12:00"
        #       @user.alarm_time = "12:00"
        #     else
        #     end
        #     @user.save
            
        #     @msg = {
        #       message: {
        #           text: "알람 시간이 #{@response} 으로 등록되었습니다-!"
        #       },
        #       keyboard: {
        #         type: "buttons",
        #         buttons: ["오늘 날씨 보기", "지역 다시 등록", "다른 지역 날씨"]# ,"알림 시간 등록"
        #       }
        #     }
        #     render json: @msg, status: :ok
        # end
    end
end
