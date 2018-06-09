class BasicController < ApplicationController
    skip_before_action :verify_authenticity_token
    def keyboard_init
        @msg =
            {
              type: "buttons",
              buttons: ["오늘 날씨 보기"]
            }
        render json: @msg, status: :ok
    end
    
    def chat_control
        @response = params[:content]
        @user_key = params[:user_key]
        @type = params[:type]
        @rain_news = ""
        Weather.last.w_weather.each do |x|
            if x == "비"
                @rain_news = "(비)비 소식이 있어요 :)"
            end
        end
        if @response == "오늘 날씨 보기"
            @msg = {
              message: {
                  text: "안녕하세요-! 날씨날씨입니당 :)오늘 최저 기온은 #{Weather.last.w_temp.sort.first},           최고 기온은 #{Weather.last.w_temp.sort.last}입니당       #{@rain_news}" ,
                  message_button: {
                    label: "자세한 날씨 보기",
                    url: "https://koreaweather.herokuapp.com"
                  }
              },
              keyboard: {
                type: "buttons",
                buttons: ["오늘 날씨 보기"]
              }
            }
            render json: @msg, status: :ok
        end
    end
end
