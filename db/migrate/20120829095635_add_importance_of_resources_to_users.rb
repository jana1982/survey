class AddImportanceOfResourcesToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :trad_mass_med_offline, :integer
    add_column :users, :trad_mass_med_online, :integer
    add_column :users, :person_contact_online_formal, :integer
    add_column :users, :person_contact_online_informal, :integer
    add_column :users, :person_contact_offline_formal, :integer
    add_column :users, :person_contact_offline_informal, :integer
    add_column :users, :self_aggregated, :integer
  end

  def self.down
  end
end
