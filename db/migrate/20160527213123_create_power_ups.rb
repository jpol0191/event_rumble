class CreatePowerUps < ActiveRecord::Migration
  def change
    create_table :power_ups do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.text :desc

      t.timestamps null: false
    end
  end
end
