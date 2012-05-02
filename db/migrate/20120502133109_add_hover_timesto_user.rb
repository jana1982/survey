class AddHoverTimestoUser < ActiveRecord::Migration
  def self.up
      add_column :users, :retweet_time, :float
      add_column :users, :favorite_time, :float
  end

  def self.down
  end
end
