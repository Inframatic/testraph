class AddUserIdToStems < ActiveRecord::Migration
  def change
    add_column :stems, :user_id, :integer
  end
end
