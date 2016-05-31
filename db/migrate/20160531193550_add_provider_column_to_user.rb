class AddProviderColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :fullname, :string
  end
end
