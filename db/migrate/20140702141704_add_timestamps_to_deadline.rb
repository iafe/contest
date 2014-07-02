class AddTimestampsToDeadline < ActiveRecord::Migration
  def change
         change_table :deadlines do |t|
            t.timestamps
        end
  end
end
