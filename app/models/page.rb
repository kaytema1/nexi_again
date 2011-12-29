class Page < ActiveRecord::Base
  attr_accessible :title, :description
  has_many :articles
end
