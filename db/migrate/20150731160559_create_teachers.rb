class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :full_name
      t.string :user_name


      t.timestamps null: false
    end
  end
end
