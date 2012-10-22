class AddLinkClickedToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :link_clicked, :text
  end

  def self.down
  end
end
