class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :summary
      t.text :description
      t.string :author

      t.timestamps
    end
  end
end
