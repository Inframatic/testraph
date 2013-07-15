class Comment < ActiveRecord::Base
	belongs_to :tracks
	belongs_to :user
	validates :text, presence: true
end
