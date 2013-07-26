class AddIsPrivateToTracks < ActiveRecord::Migration
  def change
  	add_column :tracks, :is_private, :boolean, :default => false, :null => false
  end
end
