class AddSeenAtRtToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :seen_at_rt, :string
  end

  def self.down
  end
end
