class CreateSiswas < ActiveRecord::Migration[6.0]
  def change
    create_table :siswas do |t|
      t.string :nama
      t.string :jk
      t.references :rombel, null: false, foreign_key: true
      t.references :rayon, null: false, foreign_key: true

      t.timestamps
    end
  end
end
