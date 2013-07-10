class RemoveStemsFromTracks < ActiveRecord::Migration
  def change
    remove_column :tracks, :stems, :string
  end
end
