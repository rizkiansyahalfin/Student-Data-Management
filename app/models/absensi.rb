class Absensi < ApplicationRecord
  belongs_to :siswa

  STATUS_LIST = %w[Hadir Sakit Izin Alpa].freeze

  validates :tanggal, :status_presensi, presence: true
  validates :status_presensi, inclusion: { in: STATUS_LIST, message: "%{value} bukan status presensi yang valid" }
  validates :siswa_id, uniqueness: { scope: :tanggal, message: "sudah memiliki catatan presensi untuk tanggal ini" }

  scope :pada_tanggal, ->(tgl) { where(tanggal: tgl) }
  scope :hadir, -> { where(status_presensi: 'Hadir') }
  scope :sakit, -> { where(status_presensi: 'Sakit') }
  scope :izin, -> { where(status_presensi: 'Izin') }
  scope :alpa, -> { where(status_presensi: 'Alpa') }
end
