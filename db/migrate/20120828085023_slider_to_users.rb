class SliderToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :slider, :integer
  end

  def self.down
  end
end
