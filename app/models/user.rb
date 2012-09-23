class User < ActiveRecord::Base
  attr_accessible :name, :password
  validates :password, presence:true

  has_many :tweets

  def self.authenticate(name, password)
  	user = User.find_by_name(name)
	if user && user.password == password
		user
	else
		false
	end
  end

end
