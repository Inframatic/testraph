class Track < ActiveRecord::Base
	include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }, 
	  :on => {:destroy => proc {|model, controller| model.activities.delete_all }},
	  :only => [:create]

	has_many :stems, :dependent => :destroy
	has_many :comments, :dependent => :destroy
	accepts_nested_attributes_for :stems
	belongs_to :user

	validates :user_id, presence: true

end
