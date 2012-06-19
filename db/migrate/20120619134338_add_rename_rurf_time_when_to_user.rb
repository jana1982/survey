class AddRenameRurfTimeWhenToUser < ActiveRecord::Migration
  def self.up
    rename_column :users, :surf_twitter_when, :avg_private_replies
  end

  def self.down
  end
end
