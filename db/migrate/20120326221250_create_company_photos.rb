class CreateCompanyPhotos < ActiveRecord::Migration
   def self.up
     add_column :photos, :company_id, :integer
   end

   def self.down
     remove_column :photos, :company_id
   end
  end
  