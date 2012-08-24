class AddOl2ChangeToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :local_authorities, :integer
    change_column :users, :other_sup_topic, :integer
    change_column :users, :defence, :integer
    change_column :users, :diplomacy, :integer
    change_column :users, :elections, :integer
    change_column :users, :espionage, :integer
    change_column :users, :foreign_aid, :integer
    change_column :users, :government, :integer
    change_column :users, :human_rights, :integer
    change_column :users, :parliament, :integer
    change_column :users, :parties, :integer
    change_column :users, :refugees, :integer
    change_column :users, :regional_authorities, :integer
    change_column :users, :state_budget, :integer
    change_column :users, :treaties, :integer
    change_column :users, :constitution, :integer
    change_column :users, :interior_policies, :integer
    change_column :users, :migration, :integer
    change_column :users, :referenda, :integer
    change_column :users, :citizens_initiative, :integer
    change_column :users, :lobbying, :integer
    change_column :users, :nuclear_policies, :integer
  end

  def self.down
  end
end
