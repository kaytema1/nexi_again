class User < ActiveRecord::Base
  has_many :articles
  has_many :microposts, :dependent => :destroy
  has_many :relationships, :foreign_key => "follower_id",
:dependent => :destroy

  has_many :following, :through => :relationships, :source => :followed

  has_many :reverse_relationships, :foreign_key => "followed_id",
:class_name => "Relationship",
:dependent => :destroy
  has_many :followers, :through => :reverse_relationships, :source => :follower

  has_and_belongs_to_many :roles
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me
  #has_friendly_id :username, :use_slug => true, :strip_non_ascii => true
  def feed
    Micropost.from_users_followed_by(self)
  end

  def self.from_users_followed_by(user)
    followed_ids = user.following.map(&:id).join(", ")
    where("user_id IN (#{followed_ids}) OR user_id = ?", user)
  end

  def following?(followed)
    relationships.find_by_followed_id(followed)
  end

  def follow!(followed)
    relationships.create!(:followed_id => followed.id)
  end

  def unfollow!(followed)
    relationships.find_by_followed_id(followed).destroy
  end

end
