class CreateJurusans < ActiveRecord::Migration[6.0]
  def change
    create_table :jurusans do |t|
      t.string :jurusan

      t.timestamps
    end
  end
end
