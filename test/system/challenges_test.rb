require "application_system_test_case"

class ChallengesTest < ApplicationSystemTestCase
  setup do
    @challenge = challenges(:one)
  end

  test "visiting the index" do
    visit challenges_url
    assert_selector "h1", text: "Challenges"
  end

  test "should create challenge" do
    visit challenges_url
    click_on "New challenge"

    fill_in "Description", with: @challenge.description
    fill_in "End date", with: @challenge.end_date
    fill_in "Name", with: @challenge.name
    fill_in "Start date", with: @challenge.start_date
    click_on "Create Challenge"

    assert_text "Challenge was successfully created"
    click_on "Back"
  end

  test "should update Challenge" do
    visit challenge_url(@challenge)
    click_on "Edit this challenge", match: :first

    fill_in "Description", with: @challenge.description
    fill_in "End date", with: @challenge.end_date
    fill_in "Name", with: @challenge.name
    fill_in "Start date", with: @challenge.start_date
    click_on "Update Challenge"

    assert_text "Challenge was successfully updated"
    click_on "Back"
  end

  test "should destroy Challenge" do
    visit challenge_url(@challenge)
    click_on "Destroy this challenge", match: :first

    assert_text "Challenge was successfully destroyed"
  end
end
