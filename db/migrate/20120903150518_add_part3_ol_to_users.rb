class AddPart3OlToUsers < ActiveRecord::Migration
  def self.up
    rename_column :users, :rank, :came_across_same_intrest
    rename_column :users, :person_contact_offline_informal, :came_across_twitter_list
    add_column :users, :heard_mass_media, :integer
    add_column :users, :heard_internet, :integer
    add_column :users, :read_retweet, :integer
    add_column :users, :read_reply, :integer
    add_column :users, :heard_friends_follow, :integer
    add_column :users, :heard_friends_interact, :integer
    add_column :users, :heard_friends_recommend, :integer
    add_column :users, :heard_friends_write, :integer
    add_column :users, :heard_friends_follow_nf, :integer
    add_column :users, :heard_friends_interact_nf, :integer
    add_column :users, :heard_friends_recommend_nf, :integer
    add_column :users, :heard_friends_write_nf, :integer
    add_column :users, :came_accross_wtf, :integer
    add_column :users, :came_across_bc, :integer
    add_column :users, :came_across_stories, :integer
    add_column :users, :knew_friends, :integer
    add_column :users, :knew_colleagues, :integer
    add_column :users, :knew_aquaintances, :integer
    add_column :users, :met_informal, :integer
    add_column :users, :met_formal, :integer

  end

  def self.down
  end
end
