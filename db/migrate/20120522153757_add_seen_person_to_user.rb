class AddSeenPersonToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :seen_person, :string
  end

  def self.down
  end
end
