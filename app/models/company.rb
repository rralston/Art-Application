class Company < ActiveRecord::Base
  
  attr_accessor :photo_file_name
  attr_accessible :name, :description, :photos_attributes, :address, :image, :image_file_name, :image_content_type, :image_file_size, :image_updated_at, :latitude, :website, :phone, :longitude, :visible, :email, :gmaps
  has_many :events
  has_attached_file :image,
    :styles => { :thumb=> "40x40#",
    :small  => "115x115>",
    :medium => "300x300>",
    :large =>   "400x400>"}
      #  :url => "/public/system/company/:id/:style/:basename.:extension",
      #  :path => ":rails_root/public/system/company/:id/:style/:basename.:extension"
        
  # accepts_nested_attributes_for :photos, :allow_destroy => true
        
      
      
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  acts_as_gmappable :auto_geocode=>true
  
  def gmaps4rails_address
     address
   # describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
   # "#{self.street}, #{self.city}, #{self.country}" 
   end
   def gmaps4rails_infowindow
             "#{self.name}, #{self.address} <br> 
             <a href=\"http://maps.google.com?q=#{self.name}, #{self.address}\">View on Map</a><br>
             <A href=\"tel:4155558958\">Call</a>"
     end
  
end
