require "application_system_test_case"

class CrewsTest < ApplicationSystemTestCase
  setup do
    @crew = crews(:one)
  end

  test "visiting the index" do
    visit crews_url
    assert_selector "h1", text: "Crews"
  end

  test "should create crew" do
    visit crews_url
    click_on "New crew"

    fill_in "Group", with: @crew.group_id
    fill_in "Mail", with: @crew.mail
    fill_in "Nombre", with: @crew.nombre
    click_on "Create Crew"

    assert_text "Crew was successfully created"
    click_on "Back"
  end

  test "should update Crew" do
    visit crew_url(@crew)
    click_on "Edit this crew", match: :first

    fill_in "Group", with: @crew.group_id
    fill_in "Mail", with: @crew.mail
    fill_in "Nombre", with: @crew.nombre
    click_on "Update Crew"

    assert_text "Crew was successfully updated"
    click_on "Back"
  end

  test "should destroy Crew" do
    visit crew_url(@crew)
    click_on "Destroy this crew", match: :first

    assert_text "Crew was successfully destroyed"
  end
end
