class AddTitleToStems < ActiveRecord::Migration
  def change
    add_column :stems, :title, :string
  end
end
