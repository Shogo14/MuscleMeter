class CreateTrainingMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :training_menus do |t|
      t.string :name
      t.string :training_type
      t.string :body_part_main
      t.string :body_part_sub1
      t.string :body_part_sub2

      t.timestamps
    end
  end
end
