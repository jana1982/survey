class AddOlListToUser < ActiveRecord::Migration
  def self.up
  add_column :users, :ol_list, :string
  end

  def self.down
  end
end
