class AddTwitterAccountToUsers < ActiveRecord::Migration
  def self.up
	add_column :users, :twitter_account, :integer
  end

  def self.down
  end
end
