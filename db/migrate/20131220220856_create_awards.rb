class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|
      t.string :name
      t.text :description
      t.text :rules
      t.string :sponsor
      t.string :sponsor_logo
      t.boolean :enabled

      t.timestamps
    end
  end
end
