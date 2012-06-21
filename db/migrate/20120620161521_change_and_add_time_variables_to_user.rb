class ChangeAndAddTimeVariablesToUser < ActiveRecord::Migration
  def self.up
    rename_column :users, :retweet_time, :retweet_time_m1
    rename_column :users, :favorite_time, :favorite_time_m1
    rename_column :users, :message_hover_time, :message_hover_m1
    rename_column :users, :reply_time, :reply_time_m1
    rename_column :users, :open_time, :open_time_m1
    add_column :users, :retweet_time_m2, :float
    add_column :users, :favorite_time_m2, :float
    add_column :users, :message_hover_m2, :float
    add_column :users, :reply_time_m2, :float
    add_column :users, :open_time_m2, :float

  end

  def self.down
  end
end
