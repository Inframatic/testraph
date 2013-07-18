class Comment < ActiveRecord::Base
	include PublicActivity::Model
	tracked owner: ->(controller, model) { controller && controller.current_user },
	  :on => {:destroy => proc {|model, controller| model.activities.destroy_all }},
	  :only => [:create]
	belongs_to :track
	belongs_to :user
	validates :text, presence: true
end
