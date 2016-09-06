class AddTypeIdToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :type_id, :integer
  end
end
