class AddInterestListToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :interest_list, :integer
  end

  def self.down
  end
end
