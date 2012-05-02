class AddFurtherHoverTimesToUsers < ActiveRecord::Migration
  def self.up
      add_column :users, :message_hover_time, :float
      add_column :users, :reply_time, :float
      add_column :users, :new_tweet_time, :float 
  end

  def self.down
  end
end
