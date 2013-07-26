class Track < ActiveRecord::Base
	include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }, 
	  :on => {:destroy => proc {|model, controller| model.activities.delete_all }},
	  :only => [:create]

	has_many :stems, :dependent => :destroy
	has_many :comments, :dependent => :destroy
	has_many :users, through: :collabs
	has_many :collabs, :dependent => :destroy
	belongs_to :user

	accepts_nested_attributes_for :stems
	accepts_nested_attributes_for :collabs, :allow_destroy => true, :update_only => true, :reject_if => lambda { |c| c[:email].blank? }
	validates :user_id, presence: true

end
