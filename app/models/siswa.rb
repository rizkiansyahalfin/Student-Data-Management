class Siswa < ApplicationRecord
  belongs_to :rombel
  belongs_to :rayon

  validates :nama, :jk, presence: true

  # Generate a CSV File of Siswa Records
  def self.to_csv(fields = column_names, options = {})
    CSV.generate(options) do |csv|
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

    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      siswa = find_by(id: row["id"]) || new
      permitted_attrs = row.slice("nama", "jk", "rombel_id", "rayon_id")
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