class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.text :description
      t.string :website
      t.string :email
      t.string :phone
      t.boolean :visible
      t.string :address
      t.float :longitude
      t.float :latitude
      t.boolean :gmaps

      t.timestamps
    end
  end
end
