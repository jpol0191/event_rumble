class AddChannelColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :channel, :string
  end
end
