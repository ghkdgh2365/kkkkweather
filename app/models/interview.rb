class Interview < ApplicationRecord
      validate do |interview|
        interview.errors.add_to_base("Country can't be blank") if interview.age.blank?
      end
    # validates :age, presence: true, acceptance: { message: '꼭 입력해주세요 :)' }
    # validates :sex, acceptance: { message: '꼭 입력해주세요 :)' }
    # validates :career, acceptance: { message: '꼭 입력해주세요 :)' }
    # validates :use_service, acceptance: { message: '꼭 입력해주세요 :)' }
    # validates :existing_service_uncomfortable, acceptance: { message: '꼭 입력해주세요 :)' }
    # validates :subscribe_channel_number, acceptance: { message: '꼭 입력해주세요 :)' }
    # validates :like_category, acceptance: { message: '꼭 입력해주세요 :)' }
    # validates :good_point, acceptance: { message: '꼭 입력해주세요 :)' }
    # validates :bad_point, acceptance: { message: '꼭 입력해주세요 :)' }
    # validates :recommendation, acceptance: { message: '꼭 입력해주세요 :)' }
    # validates :cause, acceptance: { message: '꼭 입력해주세요 :)' }
    # validates :screenshot, acceptance: { message: '꼭 입력해주세요 :)' }
    # validates :favorite_site, acceptance: { message: '꼭 입력해주세요 :)' }
    # validates :period, acceptance: { message: '꼭 입력해주세요 :)' }
    # validates :highlight_video, acceptance: { message: '꼭 입력해주세요 :)' }
    # validates :what_highlight_video, acceptance: { message: '꼭 입력해주세요 :)' }
    # validates :how_long_watch, acceptance: { message: '꼭 입력해주세요 :)' }
    # validates :when_watch, acceptance: { message: '꼭 입력해주세요 :)' }
    # validates :email, acceptance: { message: '꼭 입력해주세요 :)' }
    # validates :phone_number, acceptance: { message: '꼭 입력해주세요 :)' }
    # validates :gift, acceptance: { message: '꼭 입력해주세요 :)' }
    
end
