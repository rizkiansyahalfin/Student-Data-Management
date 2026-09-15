require 'test_helper'

class SiswasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @siswa = siswas(:one)
  end

  test "should get index" do
    get siswas_url
    assert_response :success
  end

  test "should get index as csv" do
    get siswas_url(format: :csv)
    assert_response :success
    assert_equal 'text/csv', response.media_type
  end

  test "should get index as xls" do
    get siswas_url(format: :xls)
    assert_response :success
  end

  test "should get new" do
    get new_siswa_url
    assert_response :success
  end

  test "should create siswa" do
    assert_difference('Siswa.count') do
      post siswas_url, params: { siswa: { jk: @siswa.jk, nama: @siswa.nama, rayon_id: @siswa.rayon_id, rombel_id: @siswa.rombel_id } }
    end

    assert_redirected_to siswa_url(Siswa.last)
  end

  test "should show siswa" do
    get siswa_url(@siswa)
    assert_response :success
  end

  test "should get edit" do
    get edit_siswa_url(@siswa)
    assert_response :success
  end

  test "should update siswa" do
    patch siswa_url(@siswa), params: { siswa: { jk: @siswa.jk, nama: @siswa.nama, rayon_id: @siswa.rayon_id, rombel_id: @siswa.rombel_id } }
    assert_redirected_to siswa_url(@siswa)
  end

  test "should destroy siswa" do
    assert_difference('Siswa.count', -1) do
      delete siswa_url(@siswa)
    end

    assert_redirected_to siswas_url
  end
end
