class AddMartialStatusToUser < ActiveRecord::Migration
  def self.up
	add_column :users, :martial_status, :integer
	change_column :users , :geschlecht , :integer
	change_column :users , :bildung , :integer
	change_column :users , :alter , :integer
  end

  def self.down
  end
end
