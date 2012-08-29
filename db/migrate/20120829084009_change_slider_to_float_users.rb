class ChangeSliderToFloatUsers < ActiveRecord::Migration
  def self.up
    change_column :users , :slider , :float
  end

  def self.down
  end
end
