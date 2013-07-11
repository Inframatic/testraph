class AddApprovedToStem < ActiveRecord::Migration
  def change
    add_column :stems, :approved, :boolean, :default => false
  end
end
