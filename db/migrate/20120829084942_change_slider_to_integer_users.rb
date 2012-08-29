class ChangeSliderToIntegerUsers < ActiveRecord::Migration
  def self.up
    change_column :users , :slider , :integer
  end

  def self.down
  end
end
