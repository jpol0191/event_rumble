class ChangePasswordDigestakeColumnNameInUser < ActiveRecord::Migration
  def change
  	rename_column :users , :password_digestake, :password_digest
  end
end
