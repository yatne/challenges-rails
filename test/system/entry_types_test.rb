require "application_system_test_case"

class EntryTypesTest < ApplicationSystemTestCase
  setup do
    @entry_type = entry_types(:one)
  end

  test "visiting the index" do
    visit entry_types_url
    assert_selector "h1", text: "Entry types"
  end

  test "should create entry type" do
    visit entry_types_url
    click_on "New entry type"

    fill_in "Challenge", with: @entry_type.challenge_id
    fill_in "Name", with: @entry_type.name
    fill_in "Units", with: @entry_type.units
    fill_in "Weight", with: @entry_type.weight
    click_on "Create Entry type"

    assert_text "Entry type was successfully created"
    click_on "Back"
  end

  test "should update Entry type" do
    visit entry_type_url(@entry_type)
    click_on "Edit this entry type", match: :first

    fill_in "Challenge", with: @entry_type.challenge_id
    fill_in "Name", with: @entry_type.name
    fill_in "Units", with: @entry_type.units
    fill_in "Weight", with: @entry_type.weight
    click_on "Update Entry type"

    assert_text "Entry type was successfully updated"
    click_on "Back"
  end

  test "should destroy Entry type" do
    visit entry_type_url(@entry_type)
    click_on "Destroy this entry type", match: :first

    assert_text "Entry type was successfully destroyed"
  end
end
