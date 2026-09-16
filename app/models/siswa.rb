require 'csv'

class Siswa < ApplicationRecord
  belongs_to :rombel
  belongs_to :rayon
  has_many :absensis, dependent: :destroy

  validates :nama, :jk, presence: true
  validates :nisn, uniqueness: true, allow_blank: true
  validates :nis, uniqueness: true, allow_blank: true
  validates :status, inclusion: { in: %w[Aktif Lulus Pindah DropOut], message: "%{value} bukan status yang valid" }, allow_blank: true

  # Generate a CSV File of Siswa Records
  def self.to_csv(fields = column_names, **options)
    CSV.generate(**options) do |csv|
      csv << fields
      all.each do |siswa|
        csv << siswa.attributes.values_at(*fields)
      end
    end
  end

  # Import CSV / Excel file into Siswa records safely
  def self.import(file)
    return false unless file.present?

    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1).map(&:to_s).map(&:strip).map(&:downcase)

    allowed_columns = %w[nisn nis nama jk rombel_id rayon_id tempat_lahir tanggal_lahir alamat telepon nama_ortu telepon_ortu status]

    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      siswa = find_by(nisn: row["nisn"]) || find_by(id: row["id"]) || new
      permitted_attrs = row.slice(*allowed_columns)
      siswa.attributes = permitted_attrs
      siswa.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename).downcase
    when '.csv', '.xls', '.xlsx'
      Roo::Spreadsheet.open(file.path)
    else
      raise "Unknown file type: #{file.original_filename}"
    end
  end
end