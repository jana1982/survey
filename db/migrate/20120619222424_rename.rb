class Rename < ActiveRecord::Migration
  def self.up
    rename_column :seeds, :survey_id, :batch_id
  end

  def self.down
  end
end
