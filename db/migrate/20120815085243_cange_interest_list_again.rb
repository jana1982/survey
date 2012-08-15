class CangeInterestListAgain < ActiveRecord::Migration
  def self.up
    change_column :users , :interest_list , :integer
  end

  def self.down
  end
end
