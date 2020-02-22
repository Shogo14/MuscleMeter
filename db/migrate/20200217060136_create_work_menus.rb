class CreateWorkMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :work_menus do |t|
      t.string :name
      t.references :work_menu_type, foreign_key: true
      t.references :training_body_part, foreign_key: true


      t.timestamps
    end
    add_index :work_menus, [:name, :work_menu_type_id], unique: true
    add_index :work_menus, [:name, :training_body_part_id], unique: true
    add_index :work_menus, [:work_menu_type_id, :created_at]
    add_index :work_menus, [:training_body_part_id, :created_at]
  end
end
