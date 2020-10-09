class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.text :description
      t.date :event_date
      t.string :location

      t.timestamps
    end
  end
end
