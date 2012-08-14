class ChangeInterestTopicToString < ActiveRecord::Migration
  def self.up
    change_column :users , :interest_list , :string
  end

  def self.down
  end
end
