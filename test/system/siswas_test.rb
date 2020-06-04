require "application_system_test_case"

class SiswasTest < ApplicationSystemTestCase
  setup do
    @siswa = siswas(:one)
  end

  test "visiting the index" do
    visit siswas_url
    assert_selector "h1", text: "Siswas"
  end

  test "creating a Siswa" do
    visit siswas_url
    click_on "New Siswa"

    fill_in "Jk", with: @siswa.jk
    fill_in "Nama", with: @siswa.nama
    fill_in "Rayon", with: @siswa.rayon_id
    fill_in "Rombel", with: @siswa.rombel_id
    click_on "Create Siswa"

    assert_text "Siswa was successfully created"
    click_on "Back"
  end

  test "updating a Siswa" do
    visit siswas_url
    click_on "Edit", match: :first

    fill_in "Jk", with: @siswa.jk
    fill_in "Nama", with: @siswa.nama
    fill_in "Rayon", with: @siswa.rayon_id
    fill_in "Rombel", with: @siswa.rombel_id
    click_on "Update Siswa"

    assert_text "Siswa was successfully updated"
    click_on "Back"
  end

  test "destroying a Siswa" do
    visit siswas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Siswa was successfully destroyed"
  end
end
