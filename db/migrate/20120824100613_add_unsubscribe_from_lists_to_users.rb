class AddUnsubscribeFromListsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :avg_unsubscribe_lists, :integer
    
  end

  def self.down
  end
end
