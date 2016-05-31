class AddUserIdColumnToGroupMember < ActiveRecord::Migration
  def change
    add_reference :group_members, :user, index: true, foreign_key: true
  end
end
