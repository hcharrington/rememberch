class Pin < ActiveRecord::Base
	acts_as_votable
	belongs_to :user
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>", :large => "1024x768>" }, :default_url => "https://s3.amazonaws.com/rememberch/site_files/image_missing.png"
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

	validates :image, presence: true
  validates :description, presence: true

  
end
