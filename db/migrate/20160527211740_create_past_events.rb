class CreatePastEvents < ActiveRecord::Migration
  def change
    create_table :past_events do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.string :url
      t.string :location
      t.string :image

      t.timestamps null: false
    end
  end
end
