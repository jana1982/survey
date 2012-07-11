class ReasonsToString < ActiveRecord::Migration
  def self.up
    change_column :nrreasons , :reason, :string
  end

  def self.down
  end
end
