class AddTimeMeasureAtToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :open_time_at, :float
    add_column :users, :reply_time_at, :float
    add_column :users, :retweet_time_at, :float
    add_column :users, :favorite_time_at, :float
    add_column :users, :message_hover_time_at, :float 
  end

  def self.down
  end
end
