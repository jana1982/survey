class ChangeMessageInteresting < ActiveRecord::Migration
  def self.up
    rename_column :users, :message_interesting, :message_informative
  end

  def self.down
  end
end
