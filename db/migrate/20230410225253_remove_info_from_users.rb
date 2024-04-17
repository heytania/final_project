class RemoveInfoFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :postal_code
    remove_column :users, :address
    remove_column :users, :first_name
    remove_column :users, :last_name
  end
end
