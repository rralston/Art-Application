class AddPhotoDescription < ActiveRecord::Migration
   def self.up
      add_column :photos, :image_description, :string
    end

    def self.down
      remove_column :photos, :image_description
    end
  end