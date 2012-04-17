class AddPositionAndTextToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :position, :integer
    add_column :users, :position_text, :string
  end

  def self.down
  end
end
