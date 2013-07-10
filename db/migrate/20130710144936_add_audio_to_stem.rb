class AddAudioToStem < ActiveRecord::Migration
  def change
    add_column :stems, :audio, :string
  end
end
