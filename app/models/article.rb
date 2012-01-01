class Article < ActiveRecord::Base

  attr_accessible :title, :author, :body, :category, :region, :status, :page_id, :image, :created_at
  has_attached_file :image

  belongs_to :page
  has_many :comments
  def to_param
    "#{id}-#{title}"
  end

end
