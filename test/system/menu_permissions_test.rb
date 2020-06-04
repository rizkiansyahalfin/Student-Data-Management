require "application_system_test_case"

class MenuPermissionsTest < ApplicationSystemTestCase
  setup do
    @menu_permission = menu_permissions(:one)
  end

  test "visiting the index" do
    visit menu_permissions_url
    assert_selector "h1", text: "Menu Permissions"
  end

  test "creating a Menu permission" do
    visit menu_permissions_url
    click_on "New Menu Permission"

    check "Create" if @menu_permission.create
    fill_in "Created by", with: @menu_permission.created_by
    fill_in "Menu", with: @menu_permission.menu_id
    check "Read" if @menu_permission.read
    check "Remove" if @menu_permission.remove
    check "Uptodate" if @menu_permission.uptodate
    fill_in "User", with: @menu_permission.user_id
    click_on "Create Menu permission"

    assert_text "Menu permission was successfully created"
    click_on "Back"
  end

  test "updating a Menu permission" do
    visit menu_permissions_url
    click_on "Edit", match: :first

    check "Create" if @menu_permission.create
    fill_in "Created by", with: @menu_permission.created_by
    fill_in "Menu", with: @menu_permission.menu_id
    check "Read" if @menu_permission.read
    check "Remove" if @menu_permission.remove
    check "Uptodate" if @menu_permission.uptodate
    fill_in "User", with: @menu_permission.user_id
    click_on "Update Menu permission"

    assert_text "Menu permission was successfully updated"
    click_on "Back"
  end

  test "destroying a Menu permission" do
    visit menu_permissions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Menu permission was successfully destroyed"
  end
end
