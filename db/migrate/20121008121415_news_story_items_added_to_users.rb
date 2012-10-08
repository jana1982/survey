class NewsStoryItemsAddedToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :seen_message_long, :text
    add_column :users, :seen_headline, :text
  end

  def self.down
  end
end
