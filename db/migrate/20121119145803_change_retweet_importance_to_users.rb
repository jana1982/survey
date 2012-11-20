class ChangeRetweetImportanceToUsers < ActiveRecord::Migration
  def self.up
    rename_column :users, :retweet_importance, :compose_tweet_clicked
    
  end

  def self.down
  end
end
