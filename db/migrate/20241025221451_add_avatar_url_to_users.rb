class AddAvatarUrlToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :avatar_url, :text
  end
end
