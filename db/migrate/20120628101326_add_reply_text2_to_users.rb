class AddReplyText2ToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :reply_text2, :string
  end

  def self.down
  end
end
