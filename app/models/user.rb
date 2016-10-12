class User < ApplicationRecord
	attr_accessor :website

	has_many :posts
	has_many :reviews
	has_many :snippets
	has_many :goals
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
