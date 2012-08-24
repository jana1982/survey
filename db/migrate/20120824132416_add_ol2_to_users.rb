class AddOl2ToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :other_str_sup_topic, :string
    add_column :users, :other_sup_topic, :string
    add_column :users, :defence, :string
    add_column :users, :diplomacy, :string
    add_column :users, :elections, :string
    add_column :users, :espionage, :string
    add_column :users, :foreign_aid, :string
    add_column :users, :government, :string
    add_column :users, :human_rights, :string
    add_column :users, :parliament, :string
    add_column :users, :parties, :string
    add_column :users, :refugees, :string
    add_column :users, :regional_authorities, :string
    add_column :users, :state_budget, :string
    add_column :users, :treaties, :string
    add_column :users, :constitution, :string
    add_column :users, :interior_policies, :string
    add_column :users, :migration, :string
    add_column :users, :referenda, :string
    add_column :users, :citizens_initiative, :string
    add_column :users, :lobbying, :string
    add_column :users, :nuclear_policies, :string
    
  end

  def self.down
  end
end
