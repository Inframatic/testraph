class Audio < ActiveRecord::Base
belongs_to :track


has_many :audio, :dependent => :destroy
end
