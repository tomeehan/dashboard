class AddCompleteToGoal < ActiveRecord::Migration[5.0]
  def change
    add_column :goals, :complete, :boolean
  end
end
