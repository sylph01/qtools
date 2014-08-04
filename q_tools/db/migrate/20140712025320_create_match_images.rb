class CreateMatchImages < ActiveRecord::Migration
  def change
    create_table :match_images do |t|
      t.integer :match_id
      t.string :image

      t.timestamps
    end
  end
end
