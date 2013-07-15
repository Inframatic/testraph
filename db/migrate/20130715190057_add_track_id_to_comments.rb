class AddTrackIdToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :track_id, :integer
  end
end
