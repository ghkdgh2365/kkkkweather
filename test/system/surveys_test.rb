require "application_system_test_case"

class SurveysTest < ApplicationSystemTestCase
  setup do
    @survey = surveys(:one)
  end

  test "visiting the index" do
    visit surveys_url
    assert_selector "h1", text: "Surveys"
  end

  test "creating a Survey" do
    visit surveys_url
    click_on "New Survey"

    fill_in "Age", with: @survey.age
    fill_in "Bad Point", with: @survey.bad_point
    fill_in "Career", with: @survey.career
    fill_in "Cause", with: @survey.cause
    fill_in "Email", with: @survey.email
    fill_in "Existing Service Uncomfortable", with: @survey.existing_service_uncomfortable
    fill_in "Favorite Site", with: @survey.favorite_site
    fill_in "Gift", with: @survey.gift
    fill_in "Good Point", with: @survey.good_point
    fill_in "Highlight Video", with: @survey.highlight_video
    fill_in "How Long Watch", with: @survey.how_long_watch
    fill_in "Like Category", with: @survey.like_category
    fill_in "Period", with: @survey.period
    fill_in "Phone Number", with: @survey.phone_number
    fill_in "Recommendation", with: @survey.recommendation
    fill_in "Screenshot", with: @survey.screenshot
    fill_in "Sex", with: @survey.sex
    fill_in "Subscribe Channel Number", with: @survey.subscribe_channel_number
    fill_in "Use Service", with: @survey.use_service
    fill_in "What Highlight Video", with: @survey.what_highlight_video
    fill_in "When Watch", with: @survey.when_watch
    click_on "Create Survey"

    assert_text "Survey was successfully created"
    click_on "Back"
  end

  test "updating a Survey" do
    visit surveys_url
    click_on "Edit", match: :first

    fill_in "Age", with: @survey.age
    fill_in "Bad Point", with: @survey.bad_point
    fill_in "Career", with: @survey.career
    fill_in "Cause", with: @survey.cause
    fill_in "Email", with: @survey.email
    fill_in "Existing Service Uncomfortable", with: @survey.existing_service_uncomfortable
    fill_in "Favorite Site", with: @survey.favorite_site
    fill_in "Gift", with: @survey.gift
    fill_in "Good Point", with: @survey.good_point
    fill_in "Highlight Video", with: @survey.highlight_video
    fill_in "How Long Watch", with: @survey.how_long_watch
    fill_in "Like Category", with: @survey.like_category
    fill_in "Period", with: @survey.period
    fill_in "Phone Number", with: @survey.phone_number
    fill_in "Recommendation", with: @survey.recommendation
    fill_in "Screenshot", with: @survey.screenshot
    fill_in "Sex", with: @survey.sex
    fill_in "Subscribe Channel Number", with: @survey.subscribe_channel_number
    fill_in "Use Service", with: @survey.use_service
    fill_in "What Highlight Video", with: @survey.what_highlight_video
    fill_in "When Watch", with: @survey.when_watch
    click_on "Update Survey"

    assert_text "Survey was successfully updated"
    click_on "Back"
  end

  test "destroying a Survey" do
    visit surveys_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Survey was successfully destroyed"
  end
end
