class Article < ActiveRecord::Base

  attr_accessible :title, :author, :body, :category, :region, :status, :page_id, :image, :created_at, :published , :user_id, :article_status_id
  has_attached_file :image , :styles => { :small => "150x150>" , :banner => "871x350>" },:default_url => 'http://placehold.it/200'

  belongs_to :page
  belongs_to :user
  belongs_to :article_status
  has_many :comments
  def to_param
    "#{id}-#{title}"
  end
  
  def statuses
    @status = 'Draft', 'Submitted', 'Published', 'Archived' 
  end
  
end
