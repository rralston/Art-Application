class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer "company_id"
      t.string :name
      t.text :description
      t.string :artist
      t.time :starttime
      t.date :startdate
      t.date :finishdate

      t.timestamps
    end
    add_index("events", "company_id")
  end
end
