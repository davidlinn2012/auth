class User < ActiveRecord::Base
  attr_accessible :name, :password
  validates :password, presence:true
end
