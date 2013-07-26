class CreateCollabsTable < ActiveRecord::Migration
  def change
    create_table :collabs do |t|
    	t.integer :track_id
    	t.integer :user_id
    end
  end
end
