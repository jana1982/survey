class Add12OlToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :ol_1, :string
    add_column :users, :ol_2, :string
    add_column :users, :ol_3, :string
    add_column :users, :ol_4, :string
    add_column :users, :ol_5, :string
    add_column :users, :ol_6, :string
    add_column :users, :ol_7, :string
    add_column :users, :ol_8, :string
    add_column :users, :ol_9, :string
    add_column :users, :ol_10, :string
    add_column :users, :ol_11, :string
    add_column :users, :ol_12, :string
    
  end

  def self.down
  end
end
