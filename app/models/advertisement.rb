class Advertisement < ActiveRecord::Base
  attr_accessible  :permalink, :page_id, :image
  has_attached_file :image , :styles => { :small => "150x150>" }
 
end
