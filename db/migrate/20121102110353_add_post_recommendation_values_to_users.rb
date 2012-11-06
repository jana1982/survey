class AddPostRecommendationValuesToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :reply_pr_relevant, :integer
    add_column :users, :reply_pr_meaningful, :integer
    add_column :users, :reply_pr_important, :integer
    add_column :users, :reply_pr_significant, :integer
    add_column :users, :reply_oc_relevant, :integer
    add_column :users, :reply_oc_meaningful, :integer
    add_column :users, :reply_oc_important, :integer
    add_column :users, :reply_oc_significant, :integer
    add_column :users, :favorite_pr_relevant, :integer
    add_column :users, :favorite_pr_meaningful, :integer
    add_column :users, :favorite_pr_important, :integer
    add_column :users, :favorite_pr_significant, :integer
    add_column :users, :favorite_oc_relevant, :integer
    add_column :users, :favorite_oc_meaningful, :integer
    add_column :users, :favorite_oc_important, :integer
    add_column :users, :favorite_oc_significant, :integer
    add_column :users, :retweet_pr_relevant, :integer
    add_column :users, :retweet_pr_meaningful, :integer
    add_column :users, :retweet_pr_important, :integer
    add_column :users, :retweet_pr_significant, :integer
    add_column :users, :retweet_oc_relevant, :integer
    add_column :users, :retweet_oc_meaningful, :integer
    add_column :users, :retweet_oc_important, :integer
    add_column :users, :retweet_oc_significant, :integer
  end

  def self.down
  end
end
