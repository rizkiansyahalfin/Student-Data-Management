class CreateRombels < ActiveRecord::Migration[6.0]
  def change
    create_table :rombels do |t|
      t.references :jurusan, null: false, foreign_key: true
      t.string :rombel

      t.timestamps
    end
  end
end
