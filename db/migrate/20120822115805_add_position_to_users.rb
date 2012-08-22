class AddPositionToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :rank, :integer
  end

  def self.down
  end
end
