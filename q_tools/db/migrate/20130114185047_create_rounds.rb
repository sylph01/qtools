class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :event_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
