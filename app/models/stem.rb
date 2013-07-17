class Stem < ActiveRecord::Base
	mount_uploader :audio, AudioUploader
	belongs_to :track
	belongs_to :user
	validates :user_id, presence: true

def findUser
@user = User.find(self.user_id)
end

end
