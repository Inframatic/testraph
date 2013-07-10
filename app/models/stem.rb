class Stem < ActiveRecord::Base
	mount_uploader :audio, AudioUploader
	belongs_to :track


end
