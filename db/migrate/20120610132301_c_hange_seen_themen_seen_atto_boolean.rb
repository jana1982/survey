class CHangeSeenThemenSeenAttoBoolean < ActiveRecord::Migration
  def self.up
    change_column :users , :seen_at, :boolean
    change_column :users, :seen_themen, :boolean
  end

  def self.down
  end
end
