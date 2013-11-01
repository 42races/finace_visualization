class AddCredentialsToUser < ActiveRecord::Migration
  def change
    add_column :users, :auth_token, :string
    add_column :users, :gender, :string
  end
end
