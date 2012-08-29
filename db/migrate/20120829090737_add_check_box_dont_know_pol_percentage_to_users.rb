class AddCheckBoxDontKnowPolPercentageToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :dk_pol_percentage, :integer
  end

  def self.down
  end
end
