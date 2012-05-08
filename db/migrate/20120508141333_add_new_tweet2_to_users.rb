class AddNewTweet2ToUsers < ActiveRecord::Migration
  def self.up
        add_column :users, :tweet_text_n, :string
  end

  def self.down
  end
end
