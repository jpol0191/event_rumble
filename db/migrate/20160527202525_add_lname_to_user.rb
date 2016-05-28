class AddLnameToUser < ActiveRecord::Migration
  def change
    add_column :users, :lname, :string
  end
end
