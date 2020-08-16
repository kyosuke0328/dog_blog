class PhotosController < ApplicationController
	def new
		@photo = Photo.new
	end

	def create
		@photo = Photo.new(photo_params)
			@photo.save
         	flash[:notice] = "Photo was successfully created."
         	redirect_to photos_path
	end

	def index
		@photos = Photo.all
	end

	def show
		@photo = Photo.find(params[:id])
        @post_comment = PostComment.new
        @member = @photo.membner
        @post_comments = @photo.post_comments
	end

	def edit
		@photo = Photo.find(params[:id])
        if @photo.member.id != current_member.id
           redirect_to photos_path
        end
	end

	def update
		@photo = Photo.find(params[:id])
        if @photo.update(photo_params)
        	flash[:notice] = "Photo was successfully created."
         	redirect_to photo_path(@photo)
        else
         	render 'edit'
        end
	end

	def destroy
		photo = Photo.find(params[:id])
        photo.destroy
    	redirect_to photos_path
	end

	private
	def photo_params
      params.require(:photo).permit(:image, :title, )

  	end

end
