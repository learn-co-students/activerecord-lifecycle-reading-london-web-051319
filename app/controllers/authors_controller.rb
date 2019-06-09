class AuthorController < ApplicationController
	before_action :set_author, only: [:show, :edit, :update, :destroy]
	has_many :posts

	def index
		@authors = Author.all
	end

	def show
	end

	def new
		@author = Author.new
	end

	def create
	  @author = Author.new(params)
	  @author.save
	  redirect_to author_path(@author)
	end

	def update
	  @author.update(params.require(:author))
     redirect_to author_path(@author)
	end

	def edit
	end


	private

	def set_author
		@author = Author.find(params[:id])
	end

end
