class AddDefaultValueToMatches < ActiveRecord::Migration
  def change
	change_column :matches, :player1_rate, :float, :default => 0.0
	change_column :matches, :player2_rate, :float, :default => 0.0
	change_column :matches, :player3_rate, :float, :default => 0.0
	change_column :matches, :player4_rate, :float, :default => 0.0

	change_column :matches, :player1_rank, :integer, :default => 4
	change_column :matches, :player2_rank, :integer, :default => 4
	change_column :matches, :player3_rank, :integer, :default => 4
	change_column :matches, :player4_rank, :integer, :default => 4
  end
end
