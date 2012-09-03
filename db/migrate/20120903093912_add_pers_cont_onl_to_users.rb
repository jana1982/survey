class AddPersContOnlToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :people_interested_email, :integer
    add_column :users, :people_interested_sn, :integer
    add_column :users, :people_interested_mb, :integer
    add_column :users, :people_interested_forum, :integer
    add_column :users, :people_interested_chat, :integer
    add_column :users, :locals_email, :integer
    add_column :users, :locals_sn, :integer
    add_column :users, :locals_mb, :integer
    add_column :users, :locals_forum, :integer
    add_column :users, :locals_chat, :integer
    add_column :users, :aquaintances_email, :integer
    add_column :users, :aquaintances_sn, :integer
    add_column :users, :aquaintances_mb, :integer
    add_column :users, :aquaintances_forum, :integer
    add_column :users, :aquaintances_chat, :integer
    add_column :users, :contact_friends_email, :integer
    add_column :users, :contact_friends_sn, :integer
    add_column :users, :contact_friends_mb, :integer
    add_column :users, :contact_friends_forum, :integer
    add_column :users, :contact_friends_chat, :integer
    add_column :users, :colleagues_email, :integer
    add_column :users, :colleagues_sn, :integer
    add_column :users, :colleagues_mb, :integer
    add_column :users, :colleagues_forum, :integer
    add_column :users, :colleagues_chat, :integer
    add_column :users, :experts_email, :integer
    add_column :users, :experts_sn, :integer
    add_column :users, :experts_mb, :integer
    add_column :users, :experts_forum, :integer
    add_column :users, :experts_chat, :integer
    add_column :users, :contact_ol_email, :integer
    add_column :users, :contact_ol_sn, :integer
    add_column :users, :contact_ol_mb, :integer
    add_column :users, :contact_ol_forum, :integer
    add_column :users, :contact_ol_chat, :integer
  end

  def self.down
  end
end
