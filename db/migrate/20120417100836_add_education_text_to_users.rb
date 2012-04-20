class AddEducationTextToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :bildung_text, :string
  end

  def self.down
  end
end
