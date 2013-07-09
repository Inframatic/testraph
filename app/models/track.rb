class Track < ActiveRecord::Base
	belongs_to :user
	validates :user_id, presence: true
	mount_uploader :audio, AudioUploader

	has_many :audio, :dependent => :destroy
end
