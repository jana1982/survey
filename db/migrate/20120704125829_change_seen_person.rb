class ChangeSeenPerson < ActiveRecord::Migration
  def self.up
    change_column :users , :seen_person, :boolean
  end

  def self.down
  end
end
