class ChangeOl2Part3ToUsers < ActiveRecord::Migration
  def self.up
    rename_column :users, :trad_mass_med_offline, :people_interested_phone
    rename_column :users, :person_contact_offline, :locals_phone
    add_column :users, :aquaintances_phone, :integer
    add_column :users, :contact_friends_phone, :integer
    add_column :users, :colleagues_phone, :integer
    add_column :users, :experts_phone, :integer
    add_column :users, :contact_ol_phone, :integer
  end

  def self.down
  end
end
