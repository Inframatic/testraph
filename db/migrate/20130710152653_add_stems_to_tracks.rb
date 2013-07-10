class AddStemsToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :stems, :string
  end
end
