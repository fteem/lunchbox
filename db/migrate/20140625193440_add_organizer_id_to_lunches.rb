class AddOrganizerIdToLunches < ActiveRecord::Migration
  def change
    add_column :lunches, :organizer_id, :integer
  end
end
