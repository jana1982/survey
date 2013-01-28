class AddInteresseAnBefragungToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :teilnahme_weitere_befr, :integer
  end

  def self.down
  end
end
