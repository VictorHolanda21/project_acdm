class CreateAdministrators < ActiveRecord::Migration
  def change
    create_table :administrators do |t|
      t.string :full_name
      t.string :user_name

      t.timestamps null: false
    end
  end
end
