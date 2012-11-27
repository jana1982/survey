class DeleteAndChangeVariablesFromUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :further_things_to_do
    remove_column :users, :further_things_in_simmulation
    change_column :users, :new_tweet_clicked, :integer
  end

  def self.down
  end
end
