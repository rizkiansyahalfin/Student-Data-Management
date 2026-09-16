class AddDetailsToSiswas < ActiveRecord::Migration[6.0]
  def change
    add_column :siswas, :nisn, :string
    add_column :siswas, :nis, :string
    add_column :siswas, :tempat_lahir, :string
    add_column :siswas, :tanggal_lahir, :date
    add_column :siswas, :alamat, :text
    add_column :siswas, :telepon, :string
    add_column :siswas, :nama_ortu, :string
    add_column :siswas, :telepon_ortu, :string
    add_column :siswas, :status, :string, default: 'Aktif'

    add_index :siswas, :nisn, unique: true
    add_index :siswas, :nis, unique: true
  end
end
