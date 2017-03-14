class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :address, :integer
  end
end
