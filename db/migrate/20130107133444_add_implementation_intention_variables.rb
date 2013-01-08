class AddImplementationIntentionVariables < ActiveRecord::Migration
  def self.up
    rename_column :users, :follow_2_clicked, :beh_exp_retweet
    change_column :users, :follow_m2, :integer
    rename_column :users, :follow_m2, :beh_exp_reply
    add_column :users, :beh_exp_favorite, :integer
    add_column :users, :beh_exp_write, :integer
    add_column :users, :beh_exp_discover_stories, :integer
    add_column :users, :beh_exp_discover_trends, :integer
    add_column :users, :beh_exp_follow, :integer
    add_column :users, :beh_exp_unfollow, :integer
    add_column :users, :beh_exp_create_lists, :integer
    add_column :users, :beh_exp_add_to_lists, :integer
    add_column :users, :beh_exp_unsubscribe_lists, :integer
    add_column :users, :beh_exp_subscribe_lists, :integer
    
    add_column :users, :t_imp_int_retweet, :integer
    add_column :users, :t_imp_int_reply, :integer
    add_column :users, :t_imp_int_favorite, :integer
    add_column :users, :t_imp_int_write, :integer
    add_column :users, :t_imp_int_discover_stories, :integer
    add_column :users, :t_imp_int_discover_trends, :integer
    add_column :users, :t_imp_int_follow, :integer
    add_column :users, :t_imp_int_unfollow, :integer
    add_column :users, :t_imp_int_create_lists, :integer
    add_column :users, :t_imp_int_add_to_lists, :integer
    add_column :users, :t_imp_int_unsubscribe_lists, :integer
    add_column :users, :t_imp_int_subscribe_lists, :integer
    
    add_column :users, :o_imp_int_retweet, :integer
    add_column :users, :o_imp_int_reply, :integer
    add_column :users, :o_imp_int_favorite, :integer
    add_column :users, :o_imp_int_write, :integer
    add_column :users, :o_imp_int_discover_stories, :integer
    add_column :users, :o_imp_int_discover_trends, :integer
    add_column :users, :o_imp_int_follow, :integer
    add_column :users, :o_imp_int_unfollow, :integer
    add_column :users, :o_imp_int_create_lists, :integer
    add_column :users, :o_imp_int_add_to_lists, :integer
    add_column :users, :o_imp_int_unsubscribe_lists, :integer
    add_column :users, :o_imp_int_subscribe_lists, :integer
    
    add_column :users, :cbx_write, :integer
    add_column :users, :cbx_discover_stories, :integer
    add_column :users, :cbx_discover_trends, :integer
    add_column :users, :cbx_follow, :integer
    add_column :users, :cbx_unfollow, :integer
    add_column :users, :cbx_create_lists, :integer
    add_column :users, :cbx_add_to_lists, :integer
    add_column :users, :cbx_unsubscribe_lists, :integer
    add_column :users, :cbx_subscribe_lists, :integer


  end

  def self.down
  end
end
