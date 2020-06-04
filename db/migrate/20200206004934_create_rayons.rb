class CreateRayons < ActiveRecord::Migration[6.0]
  def change
    create_table :rayons do |t|
      t.string :rayon

      t.timestamps
    end
  end
end
