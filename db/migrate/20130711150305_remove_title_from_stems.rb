class RemoveTitleFromStems < ActiveRecord::Migration
  def change
    remove_column :stems, :title, :string
  end
end
