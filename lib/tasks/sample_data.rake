require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:migrate'].invoke
    make_users
    make_microposts
    make_relationships
  end
end

def make_users
  admin = User.create!(:username => "Example User",
  :email => "example@railstutorial.org",
  :password => "foobar",
  :password_confirmation => "foobar")
  admin.toggle!(:admin)
  99.times do |n|
    username = Faker::Name.name
    email = "kaytema-#{n+1}@nexinnovaadvisorygroup.com"
    password = "password"
    User.create!(:username => username,
    :email => email,
    :password => password,
    :password_confirmation => password)
  end
end

def make_microposts
  User.all(:limit => 6).each do |user|
    50.times do
      content = Faker::Lorem.sentence(5)
      user.microposts.create!(:content => content)
    end
  end
end

def make_relationships
  users = User.all
  user = users.first
  following = users[1..50]
  followers = users[3..40]
  following.each { |followed| user.follow!(followed) }
  followers.each { |follower| follower.follow!(user) }
end
