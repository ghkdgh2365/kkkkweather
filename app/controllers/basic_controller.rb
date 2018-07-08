class BasicController < ApplicationController
    skip_before_action :verify_authenticity_token
    def keyboard_init
        @msg =
            {
              type: "buttons",
              buttons: ["오늘 날씨 보기", "지역 등록 하기"] # ,"알림 시간 등록"
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
          Openweather.where(region_id: @user.etc).last.weather.each do |x|
              if x == "Rain"
                  @rain_news = "(비)비 소식이 있어요 :)"
              end
          end
        end
        
        if @response == "오늘 날씨 보기"
          if User.where(user_key: @user_key).exists?
            @msg = {
              message: {
                  text: "안녕하세요-! 날씨날씨입니당 :) 오늘 #{Region.find_by(etc: @user.etc).city1 Region.find_by(etc: @user.etc).city2} 최저 기온은 #{Openweather.where(region_id: @user.etc).last.temp.sort.first},           최고 기온은 #{Openweather.where(region_id: @user.etc).last.temp.sort.last}입니당       #{@rain_news}" ,
                  message_button: {
                    label: "자세한 날씨 보기",
                    url: "https://koreaweather.herokuapp.com/home/testWeather/#{Region.find_by(etc: @user.etc).city1}/#{@user.etc}"
                  }
              },
              keyboard: {
                type: "buttons",
                buttons: ["오늘 날씨 보기", "지역 다시 등록"] # ,"알림 시간 등록"
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
                buttons: ["서울", "경기", "인천", "부산", "대구", "광주", "대전", "울산", "강원", "충북", "충남", "전북", "전남", "경북", "경남", "제주", "세종"]
              }
            }
            # 
            render json: @msg, status: :ok
        end
        
        if @response == "서울"
            @msg = {
              message: {
                  text: "#{@response}지역 중 상세 지역을 등록해주세요-!"
              },
              keyboard: {
                type: "buttons",
                buttons: ["서울특별시 종로구", "서울특별시 중구", "서울특별시 용산구", "서울특별시 성동구", "서울특별시 광진구", "서울특별시 동대문구", "서울특별시 중랑구", "서울특별시 성북구", "서울특별시 강북구", "서울특별시 도봉구", "서울특별시 노원구", "서울특별시 은평구", "서울특별시 서대문구", "서울특별시 마포구", "서울특별시 양천구", "서울특별시 강서구", "서울특별시 구로구", "서울특별시 금천구", "서울특별시 영등포구", "서울특별시 동작구", "서울특별시 관악구", "서울특별시 서초구", "서울특별시 강남구", "서울특별시 송파구", "서울특별시 강동구"]# ,"알림 시간 등록"
              }
            }
            render json: @msg, status: :ok
        end
        
        if @response == "경기"
            @msg = {
              message: {
                  text: "#{@response}지역 중 상세 지역을 등록해주세요-!"
              },
              keyboard: {
                type: "buttons",
                buttons: ["경기도 수원시장안구", "경기도 수원시권선구", "경기도 수원시팔달구", "경기도 수원시영통구", "경기도 성남시수정구", "경기도 성남시중원구", "경기도 성남시분당구", "경기도 의정부시", "경기도 안양시만안구", "경기도 안양시동안구", "경기도 부천시", "경기도 광명시", "경기도 평택시", "경기도 동두천시", "경기도 안산시상록구", "경기도 안산시단원구", "경기도 고양시덕양구", "경기도 고양시일산동구", "경기도 고양시일산서구", "경기도 과천시", "경기도 구리시", "경기도 남양주시", "경기도 오산시", "경기도 시흥시", "경기도 군포시", "경기도 의왕시", "경기도 하남시", "경기도 용인시처인구", "경기도 용인시기흥구", "경기도 용인시수지구", "경기도 파주시", "경기도 이천시", "경기도 안성시", "경기도 김포시", "경기도 화성시", "경기도 광주시", "경기도 양주시", "경기도 포천시", "경기도 여주시", "경기도 연천군", "경기도 가평군", "경기도 양평군"]# ,"알림 시간 등록"
              }
            }
            render json: @msg, status: :ok
        end        
        
        if @response == "인천"
            @msg = {
              message: {
                  text: "#{@response}지역 중 상세 지역을 등록해주세요-!"
              },
              keyboard: {
                type: "buttons",
                buttons: ["인천광역시 중구", "인천광역시 동구", "인천광역시 남구", "인천광역시 연수구", "인천광역시 남동구", "인천광역시 부평구", "인천광역시 계양구", "인천광역시 서구", "인천광역시 강화군", "인천광역시 옹진군"]# ,"알림 시간 등록"
              }
            }
            render json: @msg, status: :ok
        end                
        
        if @response == "부산"
            @msg = {
              message: {
                  text: "#{@response}지역 중 상세 지역을 등록해주세요-!"
              },
              keyboard: {
                type: "buttons",
                buttons: ["부산광역시 중구", "부산광역시 서구", "부산광역시 동구", "부산광역시 영도구", "부산광역시 부산진구", "부산광역시 동래구", "부산광역시 남구", "부산광역시 북구", "부산광역시 해운대구", "부산광역시 사하구", "부산광역시 금정구", "부산광역시 강서구", "부산광역시 연제구", "부산광역시 수영구", "부산광역시 사상구", "부산광역시 기장군"]# ,"알림 시간 등록"
              }
            }
            render json: @msg, status: :ok
        end           
        
        if @response == "대구"
            @msg = {
              message: {
                  text: "#{@response}지역 중 상세 지역을 등록해주세요-!"
              },
              keyboard: {
                type: "buttons",
                buttons: ["대구광역시 중구", "대구광역시 동구", "대구광역시 서구", "대구광역시 남구", "대구광역시 북구", "대구광역시 수성구", "대구광역시 달서구", "대구광역시 달성군"]# ,"알림 시간 등록"
              }
            }
            render json: @msg, status: :ok
        end        
        
        if @response == "광주"
            @msg = {
              message: {
                  text: "#{@response}지역 중 상세 지역을 등록해주세요-!"
              },
              keyboard: {
                type: "buttons",
                buttons: ["광주광역시 동구", "광주광역시 서구", "광주광역시 남구", "광주광역시 북구", "광주광역시 광산구"]# ,"알림 시간 등록"
              }
            }
            render json: @msg, status: :ok
        end        
        
        if @response == "대전"
            @msg = {
              message: {
                  text: "#{@response}지역 중 상세 지역을 등록해주세요-!"
              },
              keyboard: {
                type: "buttons",
                buttons: ["대전광역시 동구", "대전광역시 중구", "대전광역시 서구", "대전광역시 유성구", "대전광역시 대덕구"]# ,"알림 시간 등록"
              }
            }
            render json: @msg, status: :ok
        end           
        
        if @response == "울산"
            @msg = {
              message: {
                  text: "#{@response}지역 중 상세 지역을 등록해주세요-!"
              },
              keyboard: {
                type: "buttons",
                buttons: ["울산광역시 중구", "울산광역시 남구", "울산광역시 동구", "울산광역시 북구", "울산광역시 울주군"]# ,"알림 시간 등록"
              }
            }
            render json: @msg, status: :ok
        end        
        
        if @response == "강원"
            @msg = {
              message: {
                  text: "#{@response}지역 중 상세 지역을 등록해주세요-!"
              },
              keyboard: {
                type: "buttons",
                buttons: ["강원도 춘천시", "강원도 원주시", "강원도 강릉시", "강원도 동해시", "강원도 태백시", "강원도 속초시", "강원도 삼척시", "강원도 홍천군", "강원도 횡성군", "강원도 영월군", "강원도 평창군", "강원도 정선군", "강원도 철원군", "강원도 화천군", "강원도 양구군", "강원도 인제군", "강원도 고성군", "강원도 양양군"]# ,"알림 시간 등록"
              }
            }
            render json: @msg, status: :ok
        end
        
        if @response == "충북"
            @msg = {
              message: {
                  text: "#{@response}지역 중 상세 지역을 등록해주세요-!"
              },
              keyboard: {
                type: "buttons",
                buttons: ["충청북도 청주시상당구", "충청북도 청주시서원구", "충청북도 청주시흥덕구", "충청북도 청주시청원구", "충청북도 충주시", "충청북도 제천시", "충청북도 보은군", "충청북도 옥천군", "충청북도 영동군", "충청북도 증평군", "충청북도 진천군", "충청북도 괴산군", "충청북도 음성군", "충청북도 단양군"]# ,"알림 시간 등록"
              }
            }
            render json: @msg, status: :ok
        end        

        if @response == "충남"
            @msg = {
              message: {
                  text: "#{@response}지역 중 상세 지역을 등록해주세요-!"
              },
              keyboard: {
                type: "buttons",
                buttons: ["충청남도 천안시동남구", "충청남도 천안시서북구", "충청남도 공주시", "충청남도 보령시", "충청남도 아산시", "충청남도 서산시", "충청남도 논산시", "충청남도 계룡시", "충청남도 당진시", "충청남도 금산군", "충청남도 부여군", "충청남도 서천군", "충청남도 청양군", "충청남도 홍성군", "충청남도 예산군", "충청남도 태안군"]# ,"알림 시간 등록"
              }
            }
            render json: @msg, status: :ok
        end

        if @response == "전북"
            @msg = {
              message: {
                  text: "#{@response}지역 중 상세 지역을 등록해주세요-!"
              },
              keyboard: {
                type: "buttons",
                buttons: ["전라북도 전주시완산구", "전라북도 전주시덕진구", "전라북도 군산시", "전라북도 익산시", "전라북도 정읍시", "전라북도 남원시", "전라북도 김제시", "전라북도 완주군", "전라북도 진안군", "전라북도 무주군", "전라북도 장수군", "전라북도 임실군", "전라북도 순창군", "전라북도 고창군", "전라북도 부안군"]# ,"알림 시간 등록"
              }
            }
            render json: @msg, status: :ok
        end

        if @response == "전남"
            @msg = {
              message: {
                  text: "#{@response}지역 중 상세 지역을 등록해주세요-!"
              },
              keyboard: {
                type: "buttons",
                buttons: ["전라남도 목포시", "전라남도 여수시", "전라남도 순천시", "전라남도 나주시", "전라남도 광양시", "전라남도 담양군", "전라남도 곡성군", "전라남도 구례군", "전라남도 고흥군", "전라남도 보성군", "전라남도 화순군", "전라남도 장흥군", "전라남도 강진군", "전라남도 해남군", "전라남도 영암군", "전라남도 무안군", "전라남도 함평군", "전라남도 영광군", "전라남도 장성군", "전라남도 완도군", "전라남도 진도군", "전라남도 신안군"]# ,"알림 시간 등록"
              }
            }
            render json: @msg, status: :ok
        end

        if @response == "경북"
            @msg = {
              message: {
                  text: "#{@response}지역 중 상세 지역을 등록해주세요-!"
              },
              keyboard: {
                type: "buttons",
                buttons: ["경상북도 포항시남구", "경상북도 포항시북구", "경상북도 경주시", "경상북도 김천시", "경상북도 안동시", "경상북도 구미시", "경상북도 영주시", "경상북도 영천시", "경상북도 상주시", "경상북도 문경시", "경상북도 경산시", "경상북도 군위군", "경상북도 의성군", "경상북도 청송군", "경상북도 영양군", "경상북도 영덕군", "경상북도 청도군", "경상북도 고령군", "경상북도 성주군", "경상북도 칠곡군", "경상북도 예천군", "경상북도 봉화군", "경상북도 울진군", "경상북도 울릉군"]# ,"알림 시간 등록"
              }
            }
            render json: @msg, status: :ok
        end

        if @response == "경남"
            @msg = {
              message: {
                  text: "#{@response}지역 중 상세 지역을 등록해주세요-!"
              },
              keyboard: {
                type: "buttons",
                buttons: ["경상남도 창원시 의창구", "경상남도 창원시 성산구", "경상남도 창원시 마산합포구", "경상남도 창원시 마산회원구", "경상남도 창원시 진해구", "경상남도 진주시", "경상남도 통영시", "경상남도 사천시", "경상남도 김해시", "경상남도 밀양시", "경상남도 거제시", "경상남도 양산시", "경상남도 의령군", "경상남도 함안군", "경상남도 창녕군", "경상남도 고성군", "경상남도 남해군", "경상남도 하동군", "경상남도 산청군", "경상남도 함양군", "경상남도 거창군", "경상남도 합천군"]# ,"알림 시간 등록"
              }
            }
            render json: @msg, status: :ok
        end

        if @response == "제주"
            @msg = {
              message: {
                  text: "#{@response}지역 중 상세 지역을 등록해주세요-!"
              },
              keyboard: {
                type: "buttons",
                buttons: ["제주특별자치도 제주시", "제주특별자치도 서귀포시"]# ,"알림 시간 등록"
              }
            }
            render json: @msg, status: :ok
        end

        if @response == "세종"
            @msg = {
              message: {
                  text: "#{@response}지역 중 상세 지역을 등록해주세요-!"
              },
              keyboard: {
                type: "buttons",
                buttons: ["세종특별자치시 세종특별자치시"]# ,"알림 시간 등록"
              }
            }
            render json: @msg, status: :ok
        end

        if @response == "서울특별시 종로구" or @response == "서울특별시 중구" or @response == "서울특별시 용산구" or @response == "서울특별시 성동구" or @response == "서울특별시 광진구" or @response == "서울특별시 동대문구" or @response == "서울특별시 중랑구" or @response == "서울특별시 성북구" or @response == "서울특별시 강북구" or @response == "서울특별시 도봉구" or @response == "서울특별시 노원구" or @response == "서울특별시 은평구" or @response == "서울특별시 서대문구" or @response == "서울특별시 마포구" or @response == "서울특별시 양천구" or @response == "서울특별시 강서구" or @response == "서울특별시 구로구" or @response == "서울특별시 금천구" or @response == "서울특별시 영등포구" or @response == "서울특별시 동작구" or @response == "서울특별시 관악구" or @response == "서울특별시 서초구" or @response == "서울특별시 강남구" or @response == "서울특별시 송파구" or @response == "서울특별시 강동구" or @response == "부산광역시 중구" or @response == "부산광역시 서구" or @response == "부산광역시 동구" or @response == "부산광역시 영도구" or @response == "부산광역시 부산진구" or @response == "부산광역시 동래구" or @response == "부산광역시 남구" or @response == "부산광역시 북구" or @response == "부산광역시 해운대구" or @response == "부산광역시 사하구" or @response == "부산광역시 금정구" or @response == "부산광역시 강서구" or @response == "부산광역시 연제구" or @response == "부산광역시 수영구" or @response == "부산광역시 사상구" or @response == "부산광역시 기장군" or @response == "대구광역시 중구" or @response == "대구광역시 동구" or @response == "대구광역시 서구" or @response == "대구광역시 남구" or @response == "대구광역시 북구" or @response == "대구광역시 수성구" or @response == "대구광역시 달서구" or @response == "대구광역시 달성군" or @response == "인천광역시 중구" or @response == "인천광역시 동구" or @response == "인천광역시 남구" or @response == "인천광역시 연수구" or @response == "인천광역시 남동구" or @response == "인천광역시 부평구" or @response == "인천광역시 계양구" or @response == "인천광역시 서구" or @response == "인천광역시 강화군" or @response == "인천광역시 옹진군" or @response == "광주광역시 동구" or @response == "광주광역시 서구" or @response == "광주광역시 남구" or @response == "광주광역시 북구" or @response == "광주광역시 광산구" or @response == "대전광역시 동구" or @response == "대전광역시 중구" or @response == "대전광역시 서구" or @response == "대전광역시 유성구" or @response == "대전광역시 대덕구" or @response == "울산광역시 중구" or @response == "울산광역시 남구" or @response == "울산광역시 동구" or @response == "울산광역시 북구" or @response == "울산광역시 울주군" or @response == "세종특별자치시 세종특별자치시"
            
            if User.where(user_key: @user_key).last == "" or User.where(user_key: @user_key).last == nil
              @user = User.new
              @user.user_key = @user_key
            else
              @user = User.where(user_key: @user_key).last
            end
            @user.region = @response
            
            case @response
            when "서울특별시 종로구"
              @user.etc = 1
            when "서울특별시 중구"
              @user.etc = 2
            when "서울특별시 용산구"
              @user.etc = 3
            when "서울특별시 성동구"
              @user.etc = 4
            when "서울특별시 광진구"
              @user.etc = 5
            when "서울특별시 동대문구"
              @user.etc = 6
            when "서울특별시 중랑구"
              @user.etc = 7
            when "서울특별시 성북구"
              @user.etc = 8
            when "서울특별시 강북구"
              @user.etc = 9
            when "서울특별시 도봉구"
              @user.etc = 10
            when "서울특별시 노원구"
              @user.etc = 11
            when "서울특별시 은평구"
              @user.etc = 12
            when "서울특별시 서대문구"
              @user.etc = 13
            when "서울특별시 마포구"
              @user.etc = 14
            when "서울특별시 양천구"
              @user.etc = 15
            when "서울특별시 강서구"
              @user.etc = 16
            when "서울특별시 구로구"
              @user.etc = 17
            when "서울특별시 금천구"
              @user.etc = 18
            when "서울특별시 영등포구"
              @user.etc = 19
            when "서울특별시 동작구"
              @user.etc = 20
            when "서울특별시 관악구"
              @user.etc = 21
            when "서울특별시 서초구"
              @user.etc = 22
            when "서울특별시 강남구"
              @user.etc = 23
            when "서울특별시 송파구"
              @user.etc = 24
            when "서울특별시 강동구"
              @user.etc = 25
            when "부산광역시 중구"
              @user.etc = 26
            when "부산광역시 서구"
              @user.etc = 27
            when "부산광역시 동구"
              @user.etc = 28
            when "부산광역시 영도구"
              @user.etc = 29
            when "부산광역시 부산진구"
              @user.etc = 30
            when "부산광역시 동래구"
              @user.etc = 31
            when "부산광역시 남구"
              @user.etc = 32
            when "부산광역시 북구"
              @user.etc = 33
            when "부산광역시 해운대구"
              @user.etc = 34
            when "부산광역시 사하구"
              @user.etc = 35
            when "부산광역시 금정구"
              @user.etc = 36
            when "부산광역시 강서구"
              @user.etc = 37
            when "부산광역시 연제구"
              @user.etc = 38
            when "부산광역시 수영구"
              @user.etc = 39
            when "부산광역시 사상구"
              @user.etc = 40
            when "부산광역시 기장군"
              @user.etc = 41
            when "대구광역시 중구"
              @user.etc = 42
            when "대구광역시 동구"
              @user.etc = 43
            when "대구광역시 서구"
              @user.etc = 44
            when "대구광역시 남구"
              @user.etc = 45
            when "대구광역시 북구"
              @user.etc = 46
            when "대구광역시 수성구"
              @user.etc = 47
            when "대구광역시 달서구"
              @user.etc = 48
            when "대구광역시 달성군"
              @user.etc = 49
            when "인천광역시 중구"
              @user.etc = 50
            when "인천광역시 동구"
              @user.etc = 51
            when "인천광역시 남구"
              @user.etc = 52
            when "인천광역시 연수구"
              @user.etc = 53
            when "인천광역시 남동구"
              @user.etc = 54
            when "인천광역시 부평구"
              @user.etc = 55
            when "인천광역시 계양구"
              @user.etc = 56
            when "인천광역시 서구"
              @user.etc = 57
            when "인천광역시 강화군"
              @user.etc = 58
            when "인천광역시 옹진군"
              @user.etc = 59
            when "광주광역시 동구"
              @user.etc = 60
            when "광주광역시 서구"
              @user.etc = 61
            when "광주광역시 남구"
              @user.etc = 62
            when "광주광역시 북구"
              @user.etc = 63
            when "광주광역시 광산구"
              @user.etc = 64
            when "대전광역시 동구"
              @user.etc = 65
            when "대전광역시 중구"
              @user.etc = 66
            when "대전광역시 서구"
              @user.etc = 67
            when "대전광역시 유성구"
              @user.etc = 68
            when "대전광역시 대덕구"
              @user.etc = 69
            when "울산광역시 중구"
              @user.etc = 70
            when "울산광역시 남구"
              @user.etc = 71
            when "울산광역시 동구"
              @user.etc = 72
            when "울산광역시 북구"
              @user.etc = 73
            when "울산광역시 울주군"
              @user.etc = 74
            when "세종특별자치시 세종특별자치시"
              @user.etc = 75
            else
            end
            @user.save
            
            @msg = {
              message: {
                  text: "#{@response}지역으로 등록되었습니다-!"
              },
              keyboard: {
                type: "buttons",
                buttons: ["오늘 날씨 보기", "지역 다시 등록"]# ,"알림 시간 등록"
              }
            }
            render json: @msg, status: :ok
        end
        
        if @response == "경기도 수원시장안구" or @response == "경기도 수원시권선구" or @response == "경기도 수원시팔달구" or @response == "경기도 수원시영통구" or @response == "경기도 성남시수정구" or @response == "경기도 성남시중원구" or @response == "경기도 성남시분당구" or @response == "경기도 의정부시" or @response == "경기도 안양시만안구" or @response == "경기도 안양시동안구" or @response == "경기도 부천시" or @response == "경기도 광명시" or @response == "경기도 평택시" or @response == "경기도 동두천시" or @response == "경기도 안산시상록구" or @response == "경기도 안산시단원구" or @response == "경기도 고양시덕양구" or @response == "경기도 고양시일산동구" or @response == "경기도 고양시일산서구" or @response == "경기도 과천시" or @response == "경기도 구리시" or @response == "경기도 남양주시" or @response == "경기도 오산시" or @response == "경기도 시흥시" or @response == "경기도 군포시" or @response == "경기도 의왕시" or @response == "경기도 하남시" or @response == "경기도 용인시처인구" or @response == "경기도 용인시기흥구" or @response == "경기도 용인시수지구" or @response == "경기도 파주시" or @response == "경기도 이천시" or @response == "경기도 안성시" or @response == "경기도 김포시" or @response == "경기도 화성시" or @response == "경기도 광주시" or @response == "경기도 양주시" or @response == "경기도 포천시" or @response == "경기도 여주시" or @response == "경기도 연천군" or @response == "경기도 가평군" or @response == "경기도 양평군" or @response == "강원도 춘천시" or @response == "강원도 원주시" or @response == "강원도 강릉시" or @response == "강원도 동해시" or @response == "강원도 태백시" or @response == "강원도 속초시" or @response == "강원도 삼척시" or @response == "강원도 홍천군" or @response == "강원도 횡성군" or @response == "강원도 영월군" or @response == "강원도 평창군" or @response == "강원도 정선군" or @response == "강원도 철원군" or @response == "강원도 화천군" or @response == "강원도 양구군" or @response == "강원도 인제군" or @response == "강원도 고성군" or @response == "강원도 양양군" or @response == "충청북도 청주시상당구" or @response == "충청북도 청주시서원구" or @response == "충청북도 청주시흥덕구" or @response == "충청북도 청주시청원구" or @response == "충청북도 충주시" or @response == "충청북도 제천시" or @response == "충청북도 보은군" or @response == "충청북도 옥천군" or @response == "충청북도 영동군" or @response == "충청북도 증평군" or @response == "충청북도 진천군" or @response == "충청북도 괴산군" or @response == "충청북도 음성군" or @response == "충청북도 단양군"
            
            if User.where(user_key: @user_key).last == "" or User.where(user_key: @user_key).last == nil
              @user = User.new
              @user.user_key = @user_key
            else
              @user = User.where(user_key: @user_key).last
            end
            @user.region = @response
            
            case @response
            when "경기도 수원시장안구"
              @user.etc = 76
            when "경기도 수원시권선구"
              @user.etc = 77
            when "경기도 수원시팔달구"
              @user.etc = 78
            when "경기도 수원시영통구"
              @user.etc = 79
            when "경기도 성남시수정구"
              @user.etc = 80
            when "경기도 성남시중원구"
              @user.etc = 81
            when "경기도 성남시분당구"
              @user.etc = 82
            when "경기도 의정부시"
              @user.etc = 83
            when "경기도 안양시만안구"
              @user.etc = 84
            when "경기도 안양시동안구"
              @user.etc = 85
            when "경기도 부천시"
              @user.etc = 86
            when "경기도 광명시"
              @user.etc = 87
            when "경기도 평택시"
              @user.etc = 88
            when "경기도 동두천시"
              @user.etc = 89
            when "경기도 안산시상록구"
              @user.etc = 90
            when "경기도 안산시단원구"
              @user.etc = 91
            when "경기도 고양시덕양구"
              @user.etc = 92
            when "경기도 고양시일산동구"
              @user.etc = 93
            when "경기도 고양시일산서구"
              @user.etc = 94
            when "경기도 과천시"
              @user.etc = 95
            when "경기도 구리시"
              @user.etc = 96
            when "경기도 남양주시"
              @user.etc = 97
            when "경기도 오산시"
              @user.etc = 98
            when "경기도 시흥시"
              @user.etc = 99
            when "경기도 군포시"
              @user.etc = 100
            when "경기도 의왕시"
              @user.etc = 101
            when "경기도 하남시"
              @user.etc = 102
            when "경기도 용인시처인구"
              @user.etc = 103
            when "경기도 용인시기흥구"
              @user.etc = 104
            when "경기도 용인시수지구"
              @user.etc = 105
            when "경기도 파주시"
              @user.etc = 106
            when "경기도 이천시"
              @user.etc = 107
            when "경기도 안성시"
              @user.etc = 108
            when "경기도 김포시"
              @user.etc = 109
            when "경기도 화성시"
              @user.etc = 110
            when "경기도 광주시"
              @user.etc = 111
            when "경기도 양주시"
              @user.etc = 112
            when "경기도 포천시"
              @user.etc = 113
            when "경기도 여주시"
              @user.etc = 114
            when "경기도 연천군"
              @user.etc = 115
            when "경기도 가평군"
              @user.etc = 116
            when "경기도 양평군"
              @user.etc = 117
            when "강원도 춘천시"
              @user.etc = 118
            when "강원도 원주시"
              @user.etc = 119
            when "강원도 강릉시"
              @user.etc = 120
            when "강원도 동해시"
              @user.etc = 121
            when "강원도 태백시"
              @user.etc = 122
            when "강원도 속초시"
              @user.etc = 123
            when "강원도 삼척시"
              @user.etc = 124
            when "강원도 홍천군"
              @user.etc = 125
            when "강원도 횡성군"
              @user.etc = 126
            when "강원도 영월군"
              @user.etc = 127
            when "강원도 평창군"
              @user.etc = 128
            when "강원도 정선군"
              @user.etc = 129
            when "강원도 철원군"
              @user.etc = 130
            when "강원도 화천군"
              @user.etc = 131
            when "강원도 양구군"
              @user.etc = 132
            when "강원도 인제군"
              @user.etc = 133
            when "강원도 고성군"
              @user.etc = 134
            when "강원도 양양군"
              @user.etc = 135
            when "충청북도 청주시상당구"
              @user.etc = 136
            when "충청북도 청주시서원구"
              @user.etc = 137
            when "충청북도 청주시흥덕구"
              @user.etc = 138
            when "충청북도 청주시청원구"
              @user.etc = 139
            when "충청북도 충주시"
              @user.etc = 140
            when "충청북도 제천시"
              @user.etc = 141
            when "충청북도 보은군"
              @user.etc = 142
            when "충청북도 옥천군"
              @user.etc = 143
            when "충청북도 영동군"
              @user.etc = 144
            when "충청북도 증평군"
              @user.etc = 145
            when "충청북도 진천군"
              @user.etc = 146
            when "충청북도 괴산군"
              @user.etc = 147
            when "충청북도 음성군"
              @user.etc = 148
            when "충청북도 단양군"
              @user.etc = 149
            else
            end
            @user.save
            
            @msg = {
              message: {
                  text: "#{@response}지역으로 등록되었습니다-!"
              },
              keyboard: {
                type: "buttons",
                buttons: ["오늘 날씨 보기", "지역 다시 등록"]# ,"알림 시간 등록"
              }
            }
            render json: @msg, status: :ok
        end


        if @response == "충청남도 천안시동남구" or @response == "충청남도 천안시서북구" or @response == "충청남도 공주시" or @response == "충청남도 보령시" or @response == "충청남도 아산시" or @response == "충청남도 서산시" or @response == "충청남도 논산시" or @response == "충청남도 계룡시" or @response == "충청남도 당진시" or @response == "충청남도 금산군" or @response == "충청남도 부여군" or @response == "충청남도 서천군" or @response == "충청남도 청양군" or @response == "충청남도 홍성군" or @response == "충청남도 예산군" or @response == "충청남도 태안군" or @response == "전라북도 전주시완산구" or @response == "전라북도 전주시덕진구" or @response == "전라북도 군산시" or @response == "전라북도 익산시" or @response == "전라북도 정읍시" or @response == "전라북도 남원시" or @response == "전라북도 김제시" or @response == "전라북도 완주군" or @response == "전라북도 진안군" or @response == "전라북도 무주군" or @response == "전라북도 장수군" or @response == "전라북도 임실군" or @response == "전라북도 순창군" or @response == "전라북도 고창군" or @response == "전라북도 부안군" or @response == "전라남도 목포시" or @response == "전라남도 여수시" or @response == "전라남도 순천시" or @response == "전라남도 나주시" or @response == "전라남도 광양시" or @response == "전라남도 담양군" or @response == "전라남도 곡성군" or @response == "전라남도 구례군" or @response == "전라남도 고흥군" or @response == "전라남도 보성군" or @response == "전라남도 화순군" or @response == "전라남도 장흥군" or @response == "전라남도 강진군" or @response == "전라남도 해남군" or @response == "전라남도 영암군" or @response == "전라남도 무안군" or @response == "전라남도 함평군" or @response == "전라남도 영광군" or @response == "전라남도 장성군" or @response == "전라남도 완도군" or @response == "전라남도 진도군" or @response == "전라남도 신안군"
            
            if User.where(user_key: @user_key).last == "" or User.where(user_key: @user_key).last == nil
              @user = User.new
              @user.user_key = @user_key
            else
              @user = User.where(user_key: @user_key).last
            end
            @user.region = @response
            case @response
            when "충청남도 천안시동남구"
              @user.etc = 150
            when "충청남도 천안시서북구"
              @user.etc = 151
            when "충청남도 공주시"
              @user.etc = 152
            when "충청남도 보령시"
              @user.etc = 153
            when "충청남도 아산시"
              @user.etc = 154
            when "충청남도 서산시"
              @user.etc = 155
            when "충청남도 논산시"
              @user.etc = 156
            when "충청남도 계룡시"
              @user.etc = 157
            when "충청남도 당진시"
              @user.etc = 158
            when "충청남도 금산군"
              @user.etc = 159
            when "충청남도 부여군"
              @user.etc = 160
            when "충청남도 서천군"
              @user.etc = 161
            when "충청남도 청양군"
              @user.etc = 162
            when "충청남도 홍성군"
              @user.etc = 163
            when "충청남도 예산군"
              @user.etc = 164
            when "충청남도 태안군"
              @user.etc = 165
            when "전라북도 전주시완산구"
              @user.etc = 166
            when "전라북도 전주시덕진구"
              @user.etc = 167
            when "전라북도 군산시"
              @user.etc = 168
            when "전라북도 익산시"
              @user.etc = 169
            when "전라북도 정읍시"
              @user.etc = 170
            when "전라북도 남원시"
              @user.etc = 171
            when "전라북도 김제시"
              @user.etc = 172
            when "전라북도 완주군"
              @user.etc = 173
            when "전라북도 진안군"
              @user.etc = 174
            when "전라북도 무주군"
              @user.etc = 175
            when "전라북도 장수군"
              @user.etc = 176
            when "전라북도 임실군"
              @user.etc = 177
            when "전라북도 순창군"
              @user.etc = 178
            when "전라북도 고창군"
              @user.etc = 179
            when "전라북도 부안군"
              @user.etc = 180
            when "전라남도 목포시"
              @user.etc = 181
            when "전라남도 여수시"
              @user.etc = 182
            when "전라남도 순천시"
              @user.etc = 183
            when "전라남도 나주시"
              @user.etc = 184
            when "전라남도 광양시"
              @user.etc = 185
            when "전라남도 담양군"
              @user.etc = 186
            when "전라남도 곡성군"
              @user.etc = 187
            when "전라남도 구례군"
              @user.etc = 188
            when "전라남도 고흥군"
              @user.etc = 189
            when "전라남도 보성군"
              @user.etc = 190
            when "전라남도 화순군"
              @user.etc = 191
            when "전라남도 장흥군"
              @user.etc = 192
            when "전라남도 강진군"
              @user.etc = 193
            when "전라남도 해남군"
              @user.etc = 194
            when "전라남도 영암군"
              @user.etc = 195
            when "전라남도 무안군"
              @user.etc = 196
            when "전라남도 함평군"
              @user.etc = 197
            when "전라남도 영광군"
              @user.etc = 198
            when "전라남도 장성군"
              @user.etc = 199
            when "전라남도 완도군"
              @user.etc = 200
            when "전라남도 진도군"
              @user.etc = 201
            when "전라남도 신안군"
              @user.etc = 202
            else
            end
            @user.save
            
            @msg = {
              message: {
                  text: "#{@response}지역으로 등록되었습니다-!"
              },
              keyboard: {
                type: "buttons",
                buttons: ["오늘 날씨 보기", "지역 다시 등록"]# ,"알림 시간 등록"
              }
            }
            render json: @msg, status: :ok
        end
        
        if @response == "경상북도 포항시남구" or @response == "경상북도 포항시북구" or @response == "경상북도 경주시" or @response == "경상북도 김천시" or @response == "경상북도 안동시" or @response == "경상북도 구미시" or @response == "경상북도 영주시" or @response == "경상북도 영천시" or @response == "경상북도 상주시" or @response == "경상북도 문경시" or @response == "경상북도 경산시" or @response == "경상북도 군위군" or @response == "경상북도 의성군" or @response == "경상북도 청송군" or @response == "경상북도 영양군" or @response == "경상북도 영덕군" or @response == "경상북도 청도군" or @response == "경상북도 고령군" or @response == "경상북도 성주군" or @response == "경상북도 칠곡군" or @response == "경상북도 예천군" or @response == "경상북도 봉화군" or @response == "경상북도 울진군" or @response == "경상북도 울릉군" or @response == "경상남도 창원시 의창구" or @response == "경상남도 창원시 성산구" or @response == "경상남도 창원시 마산합포구" or @response == "경상남도 창원시 마산회원구" or @response == "경상남도 창원시 진해구" or @response == "경상남도 진주시" or @response == "경상남도 통영시" or @response == "경상남도 사천시" or @response == "경상남도 김해시" or @response == "경상남도 밀양시" or @response == "경상남도 거제시" or @response == "경상남도 양산시" or @response == "경상남도 의령군" or @response == "경상남도 함안군" or @response == "경상남도 창녕군" or @response == "경상남도 고성군" or @response == "경상남도 남해군" or @response == "경상남도 하동군" or @response == "경상남도 산청군" or @response == "경상남도 함양군" or @response == "경상남도 거창군" or @response == "경상남도 합천군" or @response == "제주특별자치도 제주시" or @response == "제주특별자치도 서귀포시"
            
            if User.where(user_key: @user_key).last == "" or User.where(user_key: @user_key).last == nil
              @user = User.new
              @user.user_key = @user_key
            else
              @user = User.where(user_key: @user_key).last
            end
            @user.region = @response
            case @response
            when "경상북도 포항시남구"
              @user.etc = 203
            when "경상북도 포항시북구"
              @user.etc = 204
            when "경상북도 경주시"
              @user.etc = 205
            when "경상북도 김천시"
              @user.etc = 206
            when "경상북도 안동시"
              @user.etc = 207
            when "경상북도 구미시"
              @user.etc = 208
            when "경상북도 영주시"
              @user.etc = 209
            when "경상북도 영천시"
              @user.etc = 210
            when "경상북도 상주시"
              @user.etc = 211
            when "경상북도 문경시"
              @user.etc = 212
            when "경상북도 경산시"
              @user.etc = 213
            when "경상북도 군위군"
              @user.etc = 214
            when "경상북도 의성군"
              @user.etc = 215
            when "경상북도 청송군"
              @user.etc = 216
            when "경상북도 영양군"
              @user.etc = 217
            when "경상북도 영덕군"
              @user.etc = 218
            when "경상북도 청도군"
              @user.etc = 219
            when "경상북도 고령군"
              @user.etc = 220
            when "경상북도 성주군"
              @user.etc = 221
            when "경상북도 칠곡군"
              @user.etc = 222
            when "경상북도 예천군"
              @user.etc = 223
            when "경상북도 봉화군"
              @user.etc = 224
            when "경상북도 울진군"
              @user.etc = 225
            when "경상북도 울릉군"
              @user.etc = 226
            when "경상남도 창원시 의창구"
              @user.etc = 227
            when "경상남도 창원시 성산구"
              @user.etc = 228
            when "경상남도 창원시 마산합포구"
              @user.etc = 229
            when "경상남도 창원시 마산회원구"
              @user.etc = 230
            when "경상남도 창원시 진해구"
              @user.etc = 231
            when "경상남도 진주시"
              @user.etc = 232
            when "경상남도 통영시"
              @user.etc = 233
            when "경상남도 사천시"
              @user.etc = 234
            when "경상남도 김해시"
              @user.etc = 235
            when "경상남도 밀양시"
              @user.etc = 236
            when "경상남도 거제시"
              @user.etc = 237
            when "경상남도 양산시"
              @user.etc = 238
            when "경상남도 의령군"
              @user.etc = 239
            when "경상남도 함안군"
              @user.etc = 240
            when "경상남도 창녕군"
              @user.etc = 241
            when "경상남도 고성군"
              @user.etc = 242
            when "경상남도 남해군"
              @user.etc = 243
            when "경상남도 하동군"
              @user.etc = 244
            when "경상남도 산청군"
              @user.etc = 245
            when "경상남도 함양군"
              @user.etc = 246
            when "경상남도 거창군"
              @user.etc = 247
            when "경상남도 합천군"
              @user.etc = 248
            when "제주특별자치도 제주시"
              @user.etc = 249
            when "제주특별자치도 서귀포시"
              @user.etc = 250
            else
            end
            @user.save
            
            @msg = {
              message: {
                  text: "#{@response}지역으로 등록되었습니다-!"
              },
              keyboard: {
                type: "buttons",
                buttons: ["오늘 날씨 보기", "지역 다시 등록"]# ,"알림 시간 등록"
              }
            }
            render json: @msg, status: :ok
        end
        # if @response == "다른 지역 날씨"
        #     @msg = {
        #       message: {
        #           text: "원하시는 지역 버튼을 눌러주세요-!"
        #       },
        #       keyboard: {
        #         type: "buttons",
        #         buttons: ["서울 날씨 보기", "수원 날씨 보기", "파주 날씨 보기", "인천 날씨 보기", "강릉 날씨 보기", "원주 날씨 보기", "춘천 날씨 보기", "대전 날씨 보기", "홍성 날씨 보기", "세종 날씨 보기", "청주 날씨 보기", "군산 날씨 보기", "광주 날씨 보기", "목포 날씨 보기", "여수 날씨 보기", "전주 날씨 보기", "대구 날씨 보기", "부산 날씨 보기", "안동 날씨 보기", "울산 날씨 보기", "창원 날씨 보기", "포항 날씨 보기", "서귀포 날씨 보기", "제주 날씨 보기"]
        #       }
        #     }
        #     render json: @msg, status: :ok
        #     # , 
        # end
        # if @response == "서울 날씨 보기" or @response == "수원 날씨 보기" or @response == "파주 날씨 보기" or @response == "인천 날씨 보기" or @response == "강릉 날씨 보기" or @response == "원주 날씨 보기" or @response == "춘천 날씨 보기"or @response == "대전 날씨 보기" or @response == "홍성 날씨 보기" or @response == "세종 날씨 보기" or @response == "청주 날씨 보기" or @response == "군산 날씨 보기" or @response == "광주 날씨 보기" or @response == "목포 날씨 보기" or @response == "여수 날씨 보기" or @response == "전주 날씨 보기" or @response == "대구 날씨 보기" or @response == "부산 날씨 보기" or @response == "안동 날씨 보기" or @response == "울산 날씨 보기" or @response == "창원 날씨 보기" or @response == "포항 날씨 보기" or @response == "서귀포 날씨 보기" or @response == "제주 날씨 보기"
        #   #  
          case @response
          when "서울 날씨 보기"
            @region = 0
          else
          end
        #   when "수원 날씨 보기"
        #     @region = 1
        #   when "파주 날씨 보기"
        #     @region = 2
        #   when "인천 날씨 보기"
        #     @region = 3
        #   when "강릉 날씨 보기"
        #     @region = 4
        #   when "원주 날씨 보기"
        #     @region = 5
        #   when "춘천 날씨 보기"
        #     @region = 6
        #   when "대전 날씨 보기"
        #     @region = 7
        #   when "홍성 날씨 보기"
        #     @region = 8
        #   when "세종 날씨 보기"
        #     @region = 9
        #   when "청주 날씨 보기"
        #     @region = 10
        #   when "군산 날씨 보기"
        #     @region = 11
        #   when "광주 날씨 보기"
        #     @region = 12
        #   when "목포 날씨 보기"
        #     @region = 13
        #   when "여수 날씨 보기"
        #     @region = 14
        #   when "전주 날씨 보기"
        #     @region = 15
        #   when "대구 날씨 보기"
        #     @region = 16
        #   when "부산 날씨 보기"
        #     @region = 17
        #   when "안동 날씨 보기"
        #     @region = 18
        #   when "울산 날씨 보기"
        #     @region = 19
        #   when "창원 날씨 보기"
        #     @region = 20
        #   when "포항 날씨 보기"
        #     @region = 21
        #   when "서귀포 날씨 보기"
        #     @region = 22
        #   when "제주 날씨 보기"
        #     @region = 23
        #   else
        #   end
        #   Weather.where(check_value: @region).last.w_weather[0..6].each do |x|
        #       if x == "비"
        #           @rain_news = "(비)비 소식이 있어요 :)"
        #       end
        #   end
        #   @msg = {
        #       message: {
        #           text: "안녕하세요-! 날씨날씨입니당 :) 오늘 #{Weather.where(check_value: @region).last.region_name} 최저 기온은 #{Weather.where(check_value: @region).last.w_temp[0..6].sort.first},           최고 기온은 #{Weather.where(check_value: @region).last.w_temp[0..6].sort.last}입니당       #{@rain_news}" ,
        #           message_button: {
        #             label: "자세한 날씨 보기",
        #             url: "https://koreaweather.herokuapp.com/home/todayWeather/#{@region}"
        #           }
        #       },
        #       keyboard: {
        #         type: "buttons",
        #         buttons: ["오늘 날씨 보기", "지역 등록 하기", "다른 지역 날씨"] # ,"알림 시간 등록"
        #       }
        #     }
        #     render json: @msg, status: :ok
        # end
        
        
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
