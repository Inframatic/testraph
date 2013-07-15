class Stem < ActiveRecord::Base
	mount_uploader :audio, AudioUploader
	belongs_to :track
	belongs_to :user

def findUser
@user = User.find(self.user_id)
end

end
