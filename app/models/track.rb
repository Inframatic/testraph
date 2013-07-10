class Track < ActiveRecord::Base
	has_many :stems
	accepts_nested_attributes_for :stems
	belongs_to :user

	validates :user_id, presence: true
end
