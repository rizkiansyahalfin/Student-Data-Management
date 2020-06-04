require "application_system_test_case"

class RombelsTest < ApplicationSystemTestCase
  setup do
    @rombel = rombels(:one)
  end

  test "visiting the index" do
    visit rombels_url
    assert_selector "h1", text: "Rombels"
  end

  test "creating a Rombel" do
    visit rombels_url
    click_on "New Rombel"

    fill_in "Jurusan", with: @rombel.jurusan_id
    fill_in "Rombel", with: @rombel.rombel
    click_on "Create Rombel"

    assert_text "Rombel was successfully created"
    click_on "Back"
  end

  test "updating a Rombel" do
    visit rombels_url
    click_on "Edit", match: :first

    fill_in "Jurusan", with: @rombel.jurusan_id
    fill_in "Rombel", with: @rombel.rombel
    click_on "Update Rombel"

    assert_text "Rombel was successfully updated"
    click_on "Back"
  end

  test "destroying a Rombel" do
    visit rombels_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Rombel was successfully destroyed"
  end
end
