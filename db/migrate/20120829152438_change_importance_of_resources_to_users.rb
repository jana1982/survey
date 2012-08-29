class ChangeImportanceOfResourcesToUsers < ActiveRecord::Migration
  def self.up
    rename_column :users, :person_contact_online_formal, :person_contact_online
    rename_column :users, :person_contact_offline_formal, :person_contact_offline
  end

  def self.down
  end
end
