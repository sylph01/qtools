class AddImageToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :image, :string
  end
end
