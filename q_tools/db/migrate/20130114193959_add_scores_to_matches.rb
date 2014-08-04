class AddScoresToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :player1_score, :string
    add_column :matches, :player2_score, :string
    add_column :matches, :player3_score, :string
    add_column :matches, :player4_score, :string
  end
end
