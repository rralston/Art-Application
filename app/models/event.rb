class Event < ActiveRecord::Base
  attr_accessible :name, :description, :artist, :starttime, :startdate, :finishdate, :company_id, :photos_attributes
  belongs_to :company
  has_many :photos
  has_attached_file :photo
  accepts_nested_attributes_for :photos, :allow_destroy => true, :reject_if => lambda { |a| a[:photo].blank? }
  accepts_nested_attributes_for :company

end
