class CreateCouses < ActiveRecord::Migration
  def change
    create_table :couses do |t|
      t.string :name
      t.integer :workload
      t.integer :value
      t.text :description

      t.timestamps null: false
    end
  end
end
