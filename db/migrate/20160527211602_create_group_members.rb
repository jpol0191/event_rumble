class CreateGroupMembers < ActiveRecord::Migration
  def change
    create_table :group_members do |t|
      t.references :group, index: true, foreign_key: true
      t.integer :friend_id

      t.timestamps null: false
    end
  end
end
