class AddMessageInterestToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :message_important, :integer
    add_column :users, :message_meaningful, :integer
    add_column :users, :message_for_me, :integer
    add_column :users, :message_remember, :integer
    add_column :users, :message_value, :integer
    add_column :users, :message_relevant, :integer
    add_column :users, :message_useful, :integer
    add_column :users, :message_attention, :integer
    add_column :users, :message_interest, :integer
    add_column :users, :message_ideas, :integer
    add_column :users, :message_helpful, :integer
    add_column :users, :message_interesting, :integer
  end

  def self.down
  end
end
