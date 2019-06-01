require "application_system_test_case"

class InterviewsTest < ApplicationSystemTestCase
  setup do
    @interview = interviews(:one)
  end

  test "visiting the index" do
    visit interviews_url
    assert_selector "h1", text: "Interviews"
  end

  test "creating a Interview" do
    visit interviews_url
    click_on "New Interview"

    fill_in "Age", with: @interview.age
    fill_in "Bad Point", with: @interview.bad_point
    fill_in "Career", with: @interview.career
    fill_in "Cause", with: @interview.cause
    fill_in "Email", with: @interview.email
    fill_in "Existing Service Uncomfortable", with: @interview.existing_service_uncomfortable
    fill_in "Favorite Site", with: @interview.favorite_site
    fill_in "Gift", with: @interview.gift
    fill_in "Good Point", with: @interview.good_point
    fill_in "Highlight Video", with: @interview.highlight_video
    fill_in "How Long Watch", with: @interview.how_long_watch
    fill_in "Like Category", with: @interview.like_category
    fill_in "Period", with: @interview.period
    fill_in "Phone Number", with: @interview.phone_number
    fill_in "Recommendation", with: @interview.recommendation
    fill_in "Screenshot", with: @interview.screenshot
    fill_in "Sex", with: @interview.sex
    fill_in "Subscribe Channel Number", with: @interview.subscribe_channel_number
    fill_in "Use Service", with: @interview.use_service
    fill_in "What Highlight Video", with: @interview.what_highlight_video
    fill_in "When Watch", with: @interview.when_watch
    click_on "Create Interview"

    assert_text "Interview was successfully created"
    click_on "Back"
  end

  test "updating a Interview" do
    visit interviews_url
    click_on "Edit", match: :first

    fill_in "Age", with: @interview.age
    fill_in "Bad Point", with: @interview.bad_point
    fill_in "Career", with: @interview.career
    fill_in "Cause", with: @interview.cause
    fill_in "Email", with: @interview.email
    fill_in "Existing Service Uncomfortable", with: @interview.existing_service_uncomfortable
    fill_in "Favorite Site", with: @interview.favorite_site
    fill_in "Gift", with: @interview.gift
    fill_in "Good Point", with: @interview.good_point
    fill_in "Highlight Video", with: @interview.highlight_video
    fill_in "How Long Watch", with: @interview.how_long_watch
    fill_in "Like Category", with: @interview.like_category
    fill_in "Period", with: @interview.period
    fill_in "Phone Number", with: @interview.phone_number
    fill_in "Recommendation", with: @interview.recommendation
    fill_in "Screenshot", with: @interview.screenshot
    fill_in "Sex", with: @interview.sex
    fill_in "Subscribe Channel Number", with: @interview.subscribe_channel_number
    fill_in "Use Service", with: @interview.use_service
    fill_in "What Highlight Video", with: @interview.what_highlight_video
    fill_in "When Watch", with: @interview.when_watch
    click_on "Update Interview"

    assert_text "Interview was successfully updated"
    click_on "Back"
  end

  test "destroying a Interview" do
    visit interviews_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Interview was successfully destroyed"
  end
end
