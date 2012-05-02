class AddRetweetImportanceToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :retweet_importance, :integer
  end

  def self.down
  end
end
