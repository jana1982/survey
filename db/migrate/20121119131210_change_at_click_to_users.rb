class ChangeAtClickToUsers < ActiveRecord::Migration
  def self.up
    rename_column :users, :at_clicked, :new_tweet_clicked
  end

  def self.down
  end
end
