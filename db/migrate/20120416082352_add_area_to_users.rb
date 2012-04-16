class AddAreaToUsers < ActiveRecord::Migration
  def self.up
	add_column :users, :area, :integer
  end

  def self.down
  end
end
