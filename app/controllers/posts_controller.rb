class PostsController < ApplicationController
	# before_action :set_post, only: [:show, :edit, :update, :destroy, :make_title_case]

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
	  @post = Post.create(post_params(:title, :description))
	  @post.save
	  redirect_to post_path(@post)
	end

	def update
		@post = Post.find(params[:id])
	  	@post.update(post_params(:title, :description))
	  redirect_to post_path(@post)
	end

	def edit
		@post = Post.find(params[:id])
	end


	private

	def set_post
		@post = Post.find(params[:id])
	end

	def post_params(*args)
		params.require(:post).permit(args)
	end

end
