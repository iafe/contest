class ChangeScoreDataTypeToScore < ActiveRecord::Migration
  
  def self.up
    change_table :scores do |t|
      t.change :total_score, :decimal, precision: 5, scale: 2
    end
  end

  def self.down
    change_table :scores do |t|
      t.change :total_score, :integer
    end
  end
  
end
