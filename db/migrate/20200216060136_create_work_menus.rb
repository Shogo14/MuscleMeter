class CreateWorkMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :work_menus do |t|
      t.string :name
      t.references :work_menu_type, foreign_key: true

      t.timestamps
    end
    add_index :work_menus, [:work_menu_type_id, :created_at]
  end
end
