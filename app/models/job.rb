class Job < ActiveRecord::Base
  attr_accessible :title, :company, :application_due, :job_description, :permalink, :image, :location
  has_attached_file :image , :styles => { :small => "150x150>" }


  def to_param
    "#{id}-#{title}"
  end

end
