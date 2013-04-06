class ChangeBildungToUsers < ActiveRecord::Migration
  def self.up
    change_column :users, :bildung_text, :integer
    rename_column :users, :bildung_text, :bildung_still_study
  end

  def self.down
  end
end
