class CreateWorkOuts < ActiveRecord::Migration[5.2]
  def change
    create_table :work_outs do |t|
      t.string :name
      t.references :training_type, foreign_key: true
      t.references :body_part, foreign_key: true

      t.timestamps
    end
    add_index :work_outs, [:name, :training_type_id], unique: true
    add_index :work_outs, [:name, :body_part_id], unique: true
    add_index :work_outs, [:training_type_id, :created_at]
    add_index :work_outs, [:body_part_id, :created_at]
  end
end
