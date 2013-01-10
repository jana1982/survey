class DeleteVariables < ActiveRecord::Migration
  def self.up
    remove_column :users, :o_imp_int_discover_stories
    remove_column :users, :o_imp_int_discover_trends
    remove_column :users, :o_imp_int_follow
    remove_column :users,:o_imp_int_unfollow
    remove_column :users, :o_imp_int_create_lists
    remove_column :users, :o_imp_int_add_to_lists
    remove_column :users, :o_imp_int_unsubscribe_lists
    remove_column :users, :o_imp_int_subscribe_lists
    remove_column :users, :t_imp_int_discover_stories
    remove_column :users, :t_imp_int_discover_trends
    remove_column :users, :t_imp_int_follow
    remove_column :users, :t_imp_int_unfollow
    remove_column :users, :t_imp_int_create_lists
    remove_column :users, :t_imp_int_add_to_lists
    remove_column :users, :t_imp_int_unsubscribe_lists
    remove_column :users, :t_imp_int_subscribe_lists
    remove_column :users, :beh_exp_discover_stories
    remove_column :users, :beh_exp_discover_trends
    remove_column :users, :beh_exp_follow
    remove_column :users, :beh_exp_unfollow
    remove_column :users, :beh_exp_create_lists
    remove_column :users, :beh_exp_add_to_lists
    remove_column :users, :beh_exp_unsubscribe_lists
    remove_column :users, :beh_exp_subscribe_lists
  end

  def self.down
  end
end
