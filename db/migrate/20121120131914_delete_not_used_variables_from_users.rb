class DeleteNotUsedVariablesFromUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :reply_clicked_at
    remove_column :users, :reply_text_at
    remove_column :users, :open_clicked_at
    remove_column :users, :message_hover_time_at
    remove_column :users, :favorite_time_at
    remove_column :users, :retweet_time_at
    remove_column :users, :reply_time_at
    remove_column :users, :open_time_at
    remove_column :users, :seen_retweet_message2
    remove_column :users, :retweet_at_clicked
    remove_column :users, :connect_clicked
    remove_column :users, :ol_list
  end

  def self.down
  end
end
