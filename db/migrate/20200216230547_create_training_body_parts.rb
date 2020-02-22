class CreateTrainingBodyParts < ActiveRecord::Migration[5.2]
  def change
    create_table :training_body_parts do |t|
      t.string :name

      t.timestamps
    end
  end
end
