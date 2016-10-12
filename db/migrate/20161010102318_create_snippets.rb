class CreateSnippets < ActiveRecord::Migration[5.0]
  def change
    create_table :snippets do |t|
      t.text :summary

      t.timestamps
    end
  end
end
