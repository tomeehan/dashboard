class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      t.string :objecive
      t.text :key_results
      t.date :deadline

      t.timestamps
    end
  end
end
