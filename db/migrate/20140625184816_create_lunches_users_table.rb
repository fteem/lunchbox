class CreateLunchesUsersTable < ActiveRecord::Migration
  def change
    create_table :lunches_users do |t|
      t.belongs_to :lunches
      t.belongs_to :users
    end
  end
end
