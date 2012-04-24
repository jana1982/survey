class AddReplyClickedToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :reply_clicked, :integer
  end

  def self.down
  end
end
