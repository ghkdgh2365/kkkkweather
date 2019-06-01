require 'test_helper'

class InterviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @interview = interviews(:one)
  end

  test "should get index" do
    get interviews_url
    assert_response :success
  end

  test "should get new" do
    get new_interview_url
    assert_response :success
  end

  test "should create interview" do
    assert_difference('Interview.count') do
      post interviews_url, params: { interview: { age: @interview.age, bad_point: @interview.bad_point, career: @interview.career, cause: @interview.cause, email: @interview.email, existing_service_uncomfortable: @interview.existing_service_uncomfortable, favorite_site: @interview.favorite_site, gift: @interview.gift, good_point: @interview.good_point, highlight_video: @interview.highlight_video, how_long_watch: @interview.how_long_watch, like_category: @interview.like_category, period: @interview.period, phone_number: @interview.phone_number, recommendation: @interview.recommendation, screenshot: @interview.screenshot, sex: @interview.sex, subscribe_channel_number: @interview.subscribe_channel_number, use_service: @interview.use_service, what_highlight_video: @interview.what_highlight_video, when_watch: @interview.when_watch } }
    end

    assert_redirected_to interview_url(Interview.last)
  end

  test "should show interview" do
    get interview_url(@interview)
    assert_response :success
  end

  test "should get edit" do
    get edit_interview_url(@interview)
    assert_response :success
  end

  test "should update interview" do
    patch interview_url(@interview), params: { interview: { age: @interview.age, bad_point: @interview.bad_point, career: @interview.career, cause: @interview.cause, email: @interview.email, existing_service_uncomfortable: @interview.existing_service_uncomfortable, favorite_site: @interview.favorite_site, gift: @interview.gift, good_point: @interview.good_point, highlight_video: @interview.highlight_video, how_long_watch: @interview.how_long_watch, like_category: @interview.like_category, period: @interview.period, phone_number: @interview.phone_number, recommendation: @interview.recommendation, screenshot: @interview.screenshot, sex: @interview.sex, subscribe_channel_number: @interview.subscribe_channel_number, use_service: @interview.use_service, what_highlight_video: @interview.what_highlight_video, when_watch: @interview.when_watch } }
    assert_redirected_to interview_url(@interview)
  end

  test "should destroy interview" do
    assert_difference('Interview.count', -1) do
      delete interview_url(@interview)
    end

    assert_redirected_to interviews_url
  end
end
