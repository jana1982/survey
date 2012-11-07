class OpenAndCheckingVariablesToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :open_reasons, :integer
    add_column :users, :reply_pr_relevant_ck, :integer
    add_column :users, :reply_pr_meaningful_ck, :integer
    add_column :users, :reply_pr_important_ck, :integer
    add_column :users, :reply_pr_significant_ck, :integer
    add_column :users, :reply_oc_relevant_ck, :integer
    add_column :users, :reply_oc_meaningful_ck, :integer
    add_column :users, :reply_oc_important_ck, :integer
    add_column :users, :reply_oc_significant_ck, :integer
    add_column :users, :favorite_pr_relevant_ck, :integer
    add_column :users, :favorite_pr_meaningful_ck, :integer
    add_column :users, :favorite_pr_important_ck, :integer
    add_column :users, :favorite_pr_significant_ck, :integer
    add_column :users, :favorite_oc_relevant_ck, :integer
    add_column :users, :favorite_oc_meaningful_ck, :integer
    add_column :users, :favorite_oc_important_ck, :integer
    add_column :users, :favorite_oc_significant_ck, :integer
    add_column :users, :retweet_pr_relevant_ck, :integer
    add_column :users, :retweet_pr_meaningful_ck, :integer
    add_column :users, :retweet_pr_important_ck, :integer
    add_column :users, :retweet_pr_significant_ck, :integer
    add_column :users, :retweet_oc_relevant_ck, :integer
    add_column :users, :retweet_oc_meaningful_ck, :integer
    add_column :users, :retweet_oc_important_ck, :integer
    add_column :users, :retweet_oc_significant_ck, :integer
  end

  def self.down
  end
end
