class AddCourtToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :court, :string
  end
end
