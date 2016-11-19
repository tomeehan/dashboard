class User < ApplicationRecord
	attr_accessor :website

	has_many :posts
	has_many :reviews
	has_many :snippets
	has_many :goals

	has_attached_file :profile,
    	style: {
      		:large =>"500x500>",
      		:medium => "300x300>",
      		:thumb => "100x100>" },
		:url  => "/assets/images/users/:id/:style/:basename.:extension",
		:path => "rails_root/public/assets/images/:id/:style/:basename.:extension"
  
  	validates_attachment :profile, 
      	content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
