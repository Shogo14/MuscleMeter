class CreateWorkMenuTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :work_menu_types do |t|
      t.string :work_type

      t.timestamps
    end
  end
end
