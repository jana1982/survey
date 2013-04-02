class DragDropDummyToUsers < ActiveRecord::Migration
  def self.up
    change_column :users, :trad_mass_med_online, :string
    rename_column :users, :trad_mass_med_online, :rank_source
    remove_column :users, :person_contact_online
    remove_column :users, :self_aggregated
    remove_column :users, :other_sources
  end

  def self.down
  end
end
