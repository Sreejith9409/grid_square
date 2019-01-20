class AddNewColToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :remote_ip, :string
  end
end
