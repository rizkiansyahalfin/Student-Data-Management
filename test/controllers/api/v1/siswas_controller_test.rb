require 'test_helper'

module Api
  module V1
    class SiswasControllerTest < ActionDispatch::IntegrationTest
      def setup
        @user = User.create!(email: "admin_test@school.sch.id", password: "password123", password_confirmation: "password123")
        @token = BaseController.encode_token(user_id: @user.id)

        @jurusan = Jurusan.create!(jurusan: "TKJ")
        @rombel = Rombel.create!(rombel: "TKJ X-1", jurusan: @jurusan)
        @rayon = Rayon.create!(rayon: "Cisarua 1")
        @siswa = Siswa.create!(nama: "Siti Aminah", jk: "Perempuan", rombel: @rombel, rayon: @rayon, nisn: "0098765432")
      end

      test "should get index with valid jwt token" do
        get api_v1_siswas_url, headers: { 'Authorization' => "Bearer #{@token}" }
        assert_response :success
      end

      test "should deny index without jwt token" do
        get api_v1_siswas_url
        assert_response :unauthorized
      end

      test "should show siswa detail via API" do
        get api_v1_siswa_url(@siswa), headers: { 'Authorization' => "Bearer #{@token}" }
        assert_response :success
        json = JSON.parse(response.body)
        assert_equal @siswa.nama, json['nama']
      end
    end
  end
end
