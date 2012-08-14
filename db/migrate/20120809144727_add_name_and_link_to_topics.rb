class AddNameAndLinkToTopics < ActiveRecord::Migration
  def self.up
    add_column :topics, :name, :string
    add_column :topics, :link, :text
  end

  def self.down
  end
end
