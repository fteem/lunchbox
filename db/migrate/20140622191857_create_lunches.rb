class CreateLunches < ActiveRecord::Migration
  def change
    create_table :lunches do |t|
      t.string :name
      t.text :description
      t.string :state
      t.date :starts_on
      t.date :ends_on

      t.timestamps
    end
  end
end
