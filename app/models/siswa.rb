class Siswa < ApplicationRecord
  belongs_to :rombel
  belongs_to :rayon
  # validates :nama, :jk, presence: true
  validates_presence_of :nama, :jk

  # Generate a CSV File of All Movie Records
  def self.to_csv(fields = column_names, options={})
    CSV.generate(options) do |csv|
      csv << fields
      all.each do |siswa|
        csv << siswa.attributes.values_at(*fields)
      end
    end
  end

  # Import CSV, Find or Create Movie by its title.
  # Update the record.
  # def self.import(file)
  #   CSV.foreach(file.path, headers: true) do |row|
  #     movies_hash = row.to_hash
  #     movie = find_or_create_by!(nama: siswas_hash[‘nama’])
  #     movie.update_attributes(movies_hash)
  #   end
  # end


# Rails Casts
# def self.to_csv(options = {})
#   CSV.generate(options) do |csv|
#     csv << column_names
#     all.each do |siswa|
#       csv << siswa.attributes.values_at(*column_names)
#     end
#   end
# end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Siswa.create! row.to_hash
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      siswa = find_by_id(row["id"]) || new
      siswa.attributes = row.to_hash.slice(*accessible_attributes)
      siswa.save!
    end
  end

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      siswa = find_by_id(row["id"]) || new
      siswa.attributes = row.to_hash.slice(*accessible_attributes)
      siswa.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when '.csv' then Csv.new(file.path, nil, :ignore)
    when '.xls' then Excel.new(file.path, nil, :ignore)
    when '.xlsx' then Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end





end