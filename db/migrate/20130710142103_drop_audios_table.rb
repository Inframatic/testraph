class DropAudiosTable < ActiveRecord::Migration
  def change
  	drop_table :audios
  end
end
