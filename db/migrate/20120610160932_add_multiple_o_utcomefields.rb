class AddMultipleOUtcomefields < ActiveRecord::Migration
  def self.up
    add_column :users, :reply_1_clicked, :integer
    add_column :users, :favorite_1_clicked, :integer
    add_column :users, :retweet_1_clicked, :integer
    add_column :users, :expand_1_clicked, :integer
    rename_column :users, :reply_clicked, :reply_2_clicked
    rename_column :users, :favorite_clicked, :favorite_2_clicked
    rename_column :users, :retweet_clicked, :retweet_2_clicked
    rename_column :users, :open_clicked, :expand_2_clicked
  end

  def self.down
  end
end
