class AddFollowVarsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :follow_m1, :float
    add_column :users, :follow_m2, :float
    add_column :users, :follow_1_clicked, :integer
    add_column :users, :follow_2_clicked, :integer
  end

  def self.down
  end
end
