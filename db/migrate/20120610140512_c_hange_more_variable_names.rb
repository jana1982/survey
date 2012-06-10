class CHangeMoreVariableNames < ActiveRecord::Migration
  def self.up
    rename_column :users, :seen_themen, :seen_multiple_messages
    change_column :users, :seen_retweet, :boolean
    change_column :users, :seen_at_rt, :boolean
    rename_column :users, :seen_retweet, :seen_retweet_message1
    rename_column :users, :seen_at_rt, :seen_retweet_message2
  end

  def self.down
  end
end
