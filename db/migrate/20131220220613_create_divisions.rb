class CreateDivisions < ActiveRecord::Migration
  def change
    create_table :divisions do |t|
      t.string :name
      t.integer :division_smallest
      t.integer :division_largest
      t.text :description

      t.timestamps
    end
  end
end
