class CreateDeadlines < ActiveRecord::Migration
  def change
    create_table :deadlines do |t|
      t.date :deadline
      t.date :actual_deadline
    end
  end
end
