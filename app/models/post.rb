class Post < ApplicationRecord
	belongs_to :user
	belongs_to :type
	has_many :reviews

  has_attached_file :post_img, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :post_img, content_type: /\Aimage\/.*\z/

	module UrlHelper
 		def url_with_protocol(url)
  			/^http/i.match(url) ? url : "http://#{url}"
 		end
	end

end