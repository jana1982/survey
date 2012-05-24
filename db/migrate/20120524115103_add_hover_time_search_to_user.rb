class AddHoverTimeSearchToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :search_time, :float 
  end

  def self.down
  end
end
