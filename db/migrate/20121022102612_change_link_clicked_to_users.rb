class ChangeLinkClickedToUsers < ActiveRecord::Migration
  def self.up
    change_column :users, :link_clicked, :integer
  end

  def self.down
  end
end
