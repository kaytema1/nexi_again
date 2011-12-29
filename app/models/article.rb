class Article < ActiveRecord::Base
  attr_accessible :title, :author, :body, :category, :region, :status, :page_id, :image
  belongs_to :page
  has_many :comments
end
