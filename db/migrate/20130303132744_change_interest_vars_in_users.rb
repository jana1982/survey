class ChangeInterestVarsInUsers < ActiveRecord::Migration
  def self.up
    rename_column :users, :defence, :economic_policy
    rename_column :users, :diplomacy, :foreign_affairs
    rename_column :users, :elections, :domestic_politics
    rename_column :users, :espionage, :legal_policy
    rename_column :users, :foreign_aid, :fiscal_policy
    rename_column :users, :government, :social_policy
    rename_column :users, :human_rights, :agricultural_policy
    rename_column :users, :local_authorities, :defence_policy
    rename_column :users, :parliament, :family_policy
    rename_column :users, :parties, :healthcare_policy
    rename_column :users, :refugees, :traffic_policy
    rename_column :users, :regional_authorities, :environmental_policy
    rename_column :users, :state_budget, :educational_policy
    rename_column :users, :treaties, :development_policy
    
    remove_column :users, :constitution
    remove_column :users, :interior_policies
    remove_column :users, :migration
    remove_column :users, :citizens_initiative
    remove_column :users, :referenda
    remove_column :users, :nuclear_policies
    remove_column :users, :lobbying
  end

  def self.down
  end
end
