class AddTrackIdToStems < ActiveRecord::Migration
  def change
    add_column :stems, :track_id, :integer
  end
end
