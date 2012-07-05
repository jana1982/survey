class AddTargetVariablesToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :intention1_write, :integer
    add_column :users, :intention2_write, :integer
    add_column :users, :intention3_write, :integer
    
    add_column :users, :intention1_discover_stories, :integer
    add_column :users, :intention2_discover_stories, :integer
    add_column :users, :intention3_discover_stories, :integer
    
    add_column :users, :intention1_discover_trends, :integer
    add_column :users, :intention2_discover_trends, :integer
    add_column :users, :intention3_discover_trends, :integer
    
    add_column :users, :intention1_follow, :integer
    add_column :users, :intention2_follow, :integer
    add_column :users, :intention3_follow, :integer
    
    add_column :users, :intention1_unfollow, :integer
    add_column :users, :intention2_unfollow, :integer
    add_column :users, :intention3_unfollow, :integer
    
    add_column :users, :intention1_create_lists, :integer
    add_column :users, :intention2_create_lists, :integer
    add_column :users, :intention3_create_lists, :integer
    
    add_column :users, :intention1_add_to_lists, :integer
    add_column :users, :intention2_add_to_lists, :integer
    add_column :users, :intention3_add_to_lists, :integer
    
    add_column :users, :intention1_unsubscribe_lists, :integer
    add_column :users, :intention2_unsubscribe_lists, :integer
    add_column :users, :intention3_unsubscribe_lists, :integer

    add_column :users, :intention1_subscribe_lists, :integer
    add_column :users, :intention2_subscribe_lists, :integer
    add_column :users, :intention3_subscribe_lists, :integer
    
  end

  def self.down
  end
end
