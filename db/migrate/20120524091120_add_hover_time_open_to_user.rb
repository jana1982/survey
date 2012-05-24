class AddHoverTimeOpenToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :open_time, :float 
  end

  def self.down
  end
end
