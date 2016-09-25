class AddPhoneToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :phone, :string
    add_column :users, :charlie_HR, :string
    add_column :users, :twitter_url, :string
    add_column :users, :twitter_handle, :string
    add_column :users, :linkedin, :string
  end
end
