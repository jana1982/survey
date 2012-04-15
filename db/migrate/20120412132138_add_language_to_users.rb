class AddLanguageToUsers < ActiveRecord::Migration
  def self.up
	add_column :users, :language, :integer
  end

  def self.down
  end
end
