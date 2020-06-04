class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.string :menu_name
      t.string :menu_route
      t.boolean :is_active
      t.bigint :created_by

      t.timestamps
    end
  end
end
