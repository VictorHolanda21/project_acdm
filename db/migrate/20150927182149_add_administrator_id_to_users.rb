class AddAdministratorIdToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :administrator, index: true, foreign_key: true
  end
end
