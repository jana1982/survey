class AddMouseTrackingtoUser < ActiveRecord::Migration
  def self.up
    add_column :users, :mousetracks, :text
  end

  def self.down
  end
end
