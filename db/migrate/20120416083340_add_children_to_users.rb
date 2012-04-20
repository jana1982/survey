class AddChildrenToUsers < ActiveRecord::Migration
  def self.up
	add_column :users, :children, :integer
  end

  def self.down
    
  end
end
