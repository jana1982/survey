class CreateSeeds < ActiveRecord::Migration
  def self.up
    create_table :seeds do |t|
      t.integer :survey_id
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :seeds
  end
end
