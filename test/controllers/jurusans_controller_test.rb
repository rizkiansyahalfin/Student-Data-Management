require 'test_helper'

class JurusansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @jurusan = jurusans(:one)
  end

  test "should get index" do
    get jurusans_url
    assert_response :success
  end

  test "should get new" do
    get new_jurusan_url
    assert_response :success
  end

  test "should create jurusan" do
    assert_difference('Jurusan.count') do
      post jurusans_url, params: { jurusan: { jurusan: @jurusan.jurusan } }
    end

    assert_redirected_to jurusan_url(Jurusan.last)
  end

  test "should show jurusan" do
    get jurusan_url(@jurusan)
    assert_response :success
  end

  test "should get edit" do
    get edit_jurusan_url(@jurusan)
    assert_response :success
  end

  test "should update jurusan" do
    patch jurusan_url(@jurusan), params: { jurusan: { jurusan: @jurusan.jurusan } }
    assert_redirected_to jurusan_url(@jurusan)
  end

  test "should destroy jurusan" do
    assert_difference('Jurusan.count', -1) do
      delete jurusan_url(@jurusan)
    end

    assert_redirected_to jurusans_url
  end
end
