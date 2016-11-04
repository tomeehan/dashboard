class CreateCompanyGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :company_goals do |t|
      t.string :objective
      t.text :key_results
      t.date :deadline
      t.boolean :complete

      t.timestamps
    end
  end
end
