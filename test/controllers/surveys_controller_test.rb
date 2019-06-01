require 'test_helper'

class SurveysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @survey = surveys(:one)
  end

  test "should get index" do
    get surveys_url
    assert_response :success
  end

  test "should get new" do
    get new_survey_url
    assert_response :success
  end

  test "should create survey" do
    assert_difference('Survey.count') do
      post surveys_url, params: { survey: { age: @survey.age, bad_point: @survey.bad_point, career: @survey.career, cause: @survey.cause, email: @survey.email, existing_service_uncomfortable: @survey.existing_service_uncomfortable, favorite_site: @survey.favorite_site, gift: @survey.gift, good_point: @survey.good_point, highlight_video: @survey.highlight_video, how_long_watch: @survey.how_long_watch, like_category: @survey.like_category, period: @survey.period, phone_number: @survey.phone_number, recommendation: @survey.recommendation, screenshot: @survey.screenshot, sex: @survey.sex, subscribe_channel_number: @survey.subscribe_channel_number, use_service: @survey.use_service, what_highlight_video: @survey.what_highlight_video, when_watch: @survey.when_watch } }
    end

    assert_redirected_to survey_url(Survey.last)
  end

  test "should show survey" do
    get survey_url(@survey)
    assert_response :success
  end

  test "should get edit" do
    get edit_survey_url(@survey)
    assert_response :success
  end

  test "should update survey" do
    patch survey_url(@survey), params: { survey: { age: @survey.age, bad_point: @survey.bad_point, career: @survey.career, cause: @survey.cause, email: @survey.email, existing_service_uncomfortable: @survey.existing_service_uncomfortable, favorite_site: @survey.favorite_site, gift: @survey.gift, good_point: @survey.good_point, highlight_video: @survey.highlight_video, how_long_watch: @survey.how_long_watch, like_category: @survey.like_category, period: @survey.period, phone_number: @survey.phone_number, recommendation: @survey.recommendation, screenshot: @survey.screenshot, sex: @survey.sex, subscribe_channel_number: @survey.subscribe_channel_number, use_service: @survey.use_service, what_highlight_video: @survey.what_highlight_video, when_watch: @survey.when_watch } }
    assert_redirected_to survey_url(@survey)
  end

  test "should destroy survey" do
    assert_difference('Survey.count', -1) do
      delete survey_url(@survey)
    end

    assert_redirected_to surveys_url
  end
end
