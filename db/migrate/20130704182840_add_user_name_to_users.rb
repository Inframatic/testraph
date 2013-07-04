class AddUserNameToUsers < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  		t.string :username
  		t.index :username
  	end
  end
end
