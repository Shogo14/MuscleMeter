class CreateTrainingMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :training_menus do |t|
      t.string :name
      t.references :training_type, foreign_key: true
      t.references :body_part, foreign_key: true

      t.timestamps
    end
    add_index :training_menus, [:name, :training_type_id], unique: true
    add_index :training_menus, [:name, :body_part_id], unique: true
    add_index :training_menus, [:training_type_id, :created_at]
    add_index :training_menus, [:body_part_id, :created_at]
  end
end
