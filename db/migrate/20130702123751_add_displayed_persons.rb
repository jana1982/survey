class AddDisplayedPersons < ActiveRecord::Migration
  def self.up
    add_column :users, :displayed_person1, :string
    add_column :users, :displayed_person2, :string
  end

  def self.down
  end
end
