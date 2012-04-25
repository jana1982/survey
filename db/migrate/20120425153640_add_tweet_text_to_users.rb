class AddTweetTextToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :tweet_text, :string
  end

  def self.down
  end
end
