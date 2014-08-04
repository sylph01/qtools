class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :password
      t.text :description

      t.timestamps
    end
  end
end
