# POSTS SCHEMA:
    # t.string   "title"
    # t.string   "summary"
    # t.text     "description"
    # t.string   "author"
    # t.datetime "created_at",            null: false
    # t.datetime "updated_at",            null: false
    # t.integer  "user_id"
    # t.integer  "category_id"
    # t.integer  "type_id"
    # t.string   "post_img_file_name"
    # t.string   "post_img_content_type"
    # t.integer  "post_img_file_size"
    # t.datetime "post_img_updated_at"
    # t.string   "url"

# TODO: Set up paperclip gem

class PostsController < ApplicationController
	
	before_action :find_book, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :edit]

	def index
		if params[:type].blank?
			@posts = Post.all.order("created_at DESC")
		else
			# Sets post cateogory 
			@type_id = Type.find_by(name: params[:type]).id
			@posts = Post.where(:type_id => @type_id).order("created_at DESC")
		end
	end

	def new
		@post = current_user.posts.build
		@types = Type.all.map{ |c| [c.name, c.id]}
	end

	def show
	end

	# TODO: Saniize URL's (see line 77)
	def create
		@post = current_user.posts.build(post_params)
		@post.type_id = params[:type_id]
		@types = Type.all.map{ |c| [c.name, c.id] }		
		if @post.save
			redirect_to posts_path
			flash[:success] = "Post successfully created"
		else
			render 'new'
		end
	end

	def edit
		@types = Type.all.map{ |c| [c.name, c.id] }
	end

	def update
		@post.type_id = params[:type_id]
		@types = Type.all.map{ |c| [c.name, c.id] }
		if @post.update(post_params)
			redirect_to post_path(@post)
			flash[:notice] = "Post successfully updated"
		else
			render 'edit'
		end 

	end

	def destroy
		@post.destroy
		redirect_to root_path
	end

  	def url_with_protocol(url)
		    /^http/i.match(url) ? url : "http://#{url}"
 	end


	private

		def post_params
			params.require(:post).permit(:title, :summary, :description, :author, :type_id ,:post_img, :url)
		end

		def find_book
			@post = Post.find(params[:id])
		end


end
