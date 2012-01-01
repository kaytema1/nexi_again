class Page < ActiveRecord::Base
  attr_accessible :title, :description
  has_many :articles
  def to_param
    "#{id}-#{title}"
  end

end
