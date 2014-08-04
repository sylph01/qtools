class AddRanksAndRatesToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :player1_rank, :integer
    add_column :matches, :player2_rank, :integer
    add_column :matches, :player3_rank, :integer
    add_column :matches, :player4_rank, :integer
    add_column :matches, :player1_rate, :float
    add_column :matches, :player2_rate, :float
    add_column :matches, :player3_rate, :float
    add_column :matches, :player4_rate, :float
  end
end
