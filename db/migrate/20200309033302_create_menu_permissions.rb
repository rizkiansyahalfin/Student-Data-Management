class CreateMenuPermissions < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_permissions do |t|
      t.references :menu, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :create
      t.boolean :read
      t.boolean :uptodate
      t.boolean :remove
      t.bigint :created_by

      t.timestamps
    end
  end
end
