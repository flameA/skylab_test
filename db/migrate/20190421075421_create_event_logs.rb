class CreateEventLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :event_logs do |t|
      t.string :event_name
      t.datetime :timestamp
      t.timestamps
    end
  end
end
