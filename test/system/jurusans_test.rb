require "application_system_test_case"

class JurusansTest < ApplicationSystemTestCase
  setup do
    @jurusan = jurusans(:one)
  end

  test "visiting the index" do
    visit jurusans_url
    assert_selector "h1", text: "Jurusans"
  end

  test "creating a Jurusan" do
    visit jurusans_url
    click_on "New Jurusan"

    fill_in "Jurusan", with: @jurusan.jurusan
    click_on "Create Jurusan"

    assert_text "Jurusan was successfully created"
    click_on "Back"
  end

  test "updating a Jurusan" do
    visit jurusans_url
    click_on "Edit", match: :first

    fill_in "Jurusan", with: @jurusan.jurusan
    click_on "Update Jurusan"

    assert_text "Jurusan was successfully updated"
    click_on "Back"
  end

  test "destroying a Jurusan" do
    visit jurusans_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Jurusan was successfully destroyed"
  end
end
