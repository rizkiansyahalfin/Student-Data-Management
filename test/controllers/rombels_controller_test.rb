require 'test_helper'

class RombelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rombel = rombels(:one)
  end

  test "should get index" do
    get rombels_url
    assert_response :success
  end

  test "should get new" do
    get new_rombel_url
    assert_response :success
  end

  test "should create rombel" do
    assert_difference('Rombel.count') do
      post rombels_url, params: { rombel: { jurusan_id: @rombel.jurusan_id, rombel: @rombel.rombel } }
    end

    assert_redirected_to rombel_url(Rombel.last)
  end

  test "should show rombel" do
    get rombel_url(@rombel)
    assert_response :success
  end

  test "should get edit" do
    get edit_rombel_url(@rombel)
    assert_response :success
  end

  test "should update rombel" do
    patch rombel_url(@rombel), params: { rombel: { jurusan_id: @rombel.jurusan_id, rombel: @rombel.rombel } }
    assert_redirected_to rombel_url(@rombel)
  end

  test "should destroy rombel" do
    assert_difference('Rombel.count', -1) do
      delete rombel_url(@rombel)
    end

    assert_redirected_to rombels_url
  end
end
