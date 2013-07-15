class User < ActiveRecord::Base
	attr_accessor :login
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

  validate :sanitize_username, :on => :create
  validates :username, uniqueness: true

  has_many :tracks, :dependent => :destroy
  has_many :stems
  has_many :comments
  

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  private

  def sanitize_username
  	self.username = username.downcase.gsub(" ", "")
  end
end
