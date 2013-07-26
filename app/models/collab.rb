class Collab < ActiveRecord::Base
	belongs_to :track
	belongs_to :user

	validates_presence_of :user
	validates_presence_of :email
	validates :user, :uniqueness => {:scope => [:track]}

	def email
		user.present? ? user.email : ""
	end

	def email=(email)
		self.user = User.where(:email => email).first
	end

end