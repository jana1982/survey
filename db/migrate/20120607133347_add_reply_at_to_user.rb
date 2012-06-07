class AddReplyAtToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :reply_text_at, :string
    add_column :users, :reply_clicked_at, :integer
    
  end

  def self.down
  end
end
