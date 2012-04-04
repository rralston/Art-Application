class Photo < ActiveRecord::Base
  belongs_to :company
  belongs_to :event
  has_attached_file :photo, 
       # :url => "/system/:class/:controller/:id/:style/:basename.:extension",
       # :path => ":rails_root/public/system/:class/:controller/:id/:style/:basename.:extension",
        :styles => { :thumb=> "40x40#",
        :small  => "115x115>",
        :medium => "300x300>",
        :large =>   "400x400>"}

  
end
