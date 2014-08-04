class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :round_id
      t.integer :match_number
      t.string :player1_name
      t.string :player1_genre
      t.string :player1_type
      t.string :player1_free_1
      t.string :player1_free_2
      t.string :player1_free_3
      t.string :player2_name
      t.string :player2_genre
      t.string :player2_type
      t.string :player2_free_1
      t.string :player2_free_2
      t.string :player2_free_3
      t.string :player3_name
      t.string :player3_genre
      t.string :player3_type
      t.string :player3_free_1
      t.string :player3_free_2
      t.string :player3_free_3
      t.string :player4_name
      t.string :player4_genre
      t.string :player4_type
      t.string :player4_free_1
      t.string :player4_free_2
      t.string :player4_free_3
      t.text :notes

      t.timestamps
    end
  end
end
