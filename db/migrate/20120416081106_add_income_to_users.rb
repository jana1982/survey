class AddIncomeToUsers < ActiveRecord::Migration
  def self.up
	add_column :users, :income, :integer
  end

  def self.down
  end
end
