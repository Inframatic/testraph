class CreateStems < ActiveRecord::Migration
  def change
    create_table :stems do |t|

      t.timestamps
    end
  end
end
