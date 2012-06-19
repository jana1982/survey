class AddTwitterUsageVariablesToUser < ActiveRecord::Migration
  def self.up
  add_column :users, :account_name, :string
  add_column :users, :number_followers, :integer
  add_column :users, :number_followeees, :integer
  add_column :users, :number_messages, :integer
  
  add_column :users, :avg_tweet_number, :integer
  add_column :users, :avg_at_replies, :integer
  add_column :users, :avg_read_tweets, :integer
  add_column :users, :avg_stories, :integer
  add_column :users, :avg_trend, :integer
  add_column :users, :avg_retweet, :integer
  add_column :users, :avg_follow, :integer
  add_column :users, :avg_login, :integer
  add_column :users, :avg_search_keywords, :integer
  add_column :users, :avg_search_accounts, :integer
  add_column :users, :avg_activities_friends, :integer
  add_column :users, :avg_who_to_follow, :integer
  add_column :users, :avg_browse_categories, :integer
  add_column :users, :avg_find_friends, :integer
  add_column :users, :avg_create_lists, :integer
  add_column :users, :avg_add_accounts_lists, :integer
  add_column :users, :avg_subscribe_lists, :integer
  add_column :users, :avg_delete_accounts_lists, :integer
  add_column :users, :avg_unfollow_account, :integer
  add_column :users, :avg_favorite_tweets, :integer
  
  add_column :users, :surf_twitter_week, :integer
  add_column :users, :surf_twitter_weekend, :integer
  add_column :users, :surf_twitter_when, :integer
  
  end

  def self.down
  end
end
