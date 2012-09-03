class AddTwitterPrivWorkToUsers < ActiveRecord::Migration
  def self.up
    rename_column :users, :person_contact_online_informal, :twitter_privat_work
  end

  def self.down
  end
end
