class AddPhotosToCompanies < ActiveRecord::Migration
    def self.up
      add_column :companies, :image_file_name, :string
      add_column :companies, :image_content_type, :string
      add_column :companies, :image_file_size, :integer
    end

    def self.down
      remove_column :companies, :image_file_name
      remove_column :companies, :image_content_type
      remove_column :companies, :image_file_size
    end
  end