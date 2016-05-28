class ChangePasswordColumnNameInUser < ActiveRecord::Migration
  def change
  	rename_column :users , :password, :password_digestake
  end
end
