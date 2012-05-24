class AddRandomRetweetToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :seen_retweet, :string
  end

  def self.down
  end
end
