class AddReplyTextToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :reply_text, :string
  end

  def self.down
  end
end
