class MatchImage < ActiveRecord::Base
  attr_accessible :image, :match_id
  
  mount_uploader :image, ImageUploader
  
  belongs_to :match
end
