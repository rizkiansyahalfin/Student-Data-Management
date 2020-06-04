require 'test_helper'

class MenuPermissionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @menu_permission = menu_permissions(:one)
  end

  test "should get index" do
    get menu_permissions_url
    assert_response :success
  end

  test "should get new" do
    get new_menu_permission_url
    assert_response :success
  end

  test "should create menu_permission" do
    assert_difference('MenuPermission.count') do
      post menu_permissions_url, params: { menu_permission: { create: @menu_permission.create, created_by: @menu_permission.created_by, menu_id: @menu_permission.menu_id, read: @menu_permission.read, remove: @menu_permission.remove, uptodate: @menu_permission.uptodate, user_id: @menu_permission.user_id } }
    end

    assert_redirected_to menu_permission_url(MenuPermission.last)
  end

  test "should show menu_permission" do
    get menu_permission_url(@menu_permission)
    assert_response :success
  end

  test "should get edit" do
    get edit_menu_permission_url(@menu_permission)
    assert_response :success
  end

  test "should update menu_permission" do
    patch menu_permission_url(@menu_permission), params: { menu_permission: { create: @menu_permission.create, created_by: @menu_permission.created_by, menu_id: @menu_permission.menu_id, read: @menu_permission.read, remove: @menu_permission.remove, uptodate: @menu_permission.uptodate, user_id: @menu_permission.user_id } }
    assert_redirected_to menu_permission_url(@menu_permission)
  end

  test "should destroy menu_permission" do
    assert_difference('MenuPermission.count', -1) do
      delete menu_permission_url(@menu_permission)
    end

    assert_redirected_to menu_permissions_url
  end
end
