class Attendances < ActiveRecord::Migration[6.0]
  def change
    create_table :attendances do |t|
      t.belongs_to "attended_event"
      t.belongs_to "attendee"

      t.timestamps
    end
  end
end
