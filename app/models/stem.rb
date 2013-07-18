class Stem < ActiveRecord::Base
	include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user },
	  :on => {:destroy => proc {|model, controller| model.activities.destroy_all }},
	  :only => [:create]
	mount_uploader :audio, AudioUploader
	belongs_to :track
	belongs_to :user
	validates :user_id, presence: true
	validates :audio, presence: true
	validates :title, presence: true

def findUser
@user = User.find(self.user_id)
end

end
