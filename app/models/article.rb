class Article < ActiveRecord::Base

  attr_accessible :title, :author, :body, :category, :region, :status, :page_id, :image, :created_at, :published , :user_id
  has_attached_file :image , :styles => { :small => "150x150>" , :banner => "871x350>" }

  belongs_to :page
  belongs_to :user
  has_many :comments
  def to_param
    "#{id}-#{title}"
  end

end
