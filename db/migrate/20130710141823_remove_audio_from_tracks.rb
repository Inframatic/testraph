class RemoveAudioFromTracks < ActiveRecord::Migration
  def change
    remove_column :tracks, :audio, :string
  end
end
