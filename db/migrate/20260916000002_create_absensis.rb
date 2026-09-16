class CreateAbsensis < ActiveRecord::Migration[6.0]
  def change
    create_table :absensis do |t|
      t.references :siswa, null: false, foreign_key: true
      t.date :tanggal, null: false
      t.string :status_presensi, null: false, default: 'Hadir'
      t.string :keterangan

      t.timestamps
    end

    add_index :absensis, [:siswa_id, :tanggal], unique: true
  end
end
