class PhotosController < ApplicationController
	def new
		@photo = Photo.new
	end

	def create
		@photo = Photo.new(photo_params)
		@photo.member_id = current_member.id
		if
			@photo.save
         	flash[:notice] = "新規投稿が完了しました"
         	redirect_to photo_path(@photo.id)
        else
         	flash[:alert] = "入力内容に誤りがあります"
         	render :new
        end
	end

	def index
		@photos = Photo.page(params[:page]).per(15).order(created_at: :desc)
	end

	def show
		@photo = Photo.find(params[:id])
        @member = @photo.member
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
        	flash[:notice] = "Photoを更新しました"
         	redirect_to photo_path(@photo)
        else
        	flash[:alert] = "入力内容に誤りがあります"
         	render :edit
        end
	end

	def destroy
		photo = Photo.find(params[:id])
    if photo.destroy
    	flash[:notice] = "Photoを削除しました"
    	redirect_to photos_path
    else
    	flash[:alert] = "Photoを削除できませんでした"
    	rende :show
    end
	end

	private
	def photo_params
    params.require(:photo).permit(:image, :member_id )

  end

end
