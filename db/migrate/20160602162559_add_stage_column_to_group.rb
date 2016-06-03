class AddStageColumnToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :stage, :string
  end
end
