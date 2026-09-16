require 'test_helper'

class AbsensiTest < ActiveSupport::TestCase
  def setup
    @jurusan = Jurusan.create!(jurusan: "PPLG")
    @rombel = Rombel.create!(rombel: "PPLG X-1", jurusan: @jurusan)
    @rayon = Rayon.create!(rayon: "Ciawi 1")
    @siswa = Siswa.create!(nama: "Budi Santoso", jk: "Laki-laki", rombel: @rombel, rayon: @rayon, nisn: "0012345678")
  end

  test "valid absensi" do
    absensi = Absensi.new(siswa: @siswa, tanggal: Date.today, status_presensi: "Hadir", keterangan: "Tepat waktu")
    assert absensi.valid?
  end

  test "invalid without status_presensi" do
    absensi = Absensi.new(siswa: @siswa, tanggal: Date.today, status_presensi: nil)
    assert_not absensi.valid?
  end

  test "uniqueness of presensi per siswa per date" do
    Absensi.create!(siswa: @siswa, tanggal: Date.today, status_presensi: "Hadir")
    duplicate = Absensi.new(siswa: @siswa, tanggal: Date.today, status_presensi: "Sakit")
    assert_not duplicate.valid?
  end
end
