class CreateWorkOuts < ActiveRecord::Migration[5.2]
  def change
    create_table :work_outs do |t|
      t.date :training_date
      t.references :user, foreign_key: true
      t.references :training_menu, foreign_key: true
      t.float :weight
      t.integer :rep
      t.integer :set_count

      t.timestamps
    end
    add_index :work_outs,[:training_date,:user_id,:training_menu_id,:weight], unique: true, name: 'one_user_work_out_unique_index'
  end
end
