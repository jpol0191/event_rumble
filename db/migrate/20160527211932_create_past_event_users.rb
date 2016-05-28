class CreatePastEventUsers < ActiveRecord::Migration
  def change
    create_table :past_event_users do |t|
      t.references :past_event, index: true, foreign_key: true
      t.integer :friend_id

      t.timestamps null: false
    end
  end
end
