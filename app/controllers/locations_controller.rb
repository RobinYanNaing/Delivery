class LocationsController < ApplicationController
	before_action :find_location, only: [:show, :edit, :update, :destroy]
	def index
		@location = Location.all.order("created_at DESC")
	end

	def new
		@location = current_user.locations.build
	end

	def show

	end

	def create
		@location = current_user.locations.build(location_params)
		if @location.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit

	end

	def update
		if @location.update(location_params)
			redirect_to location_path
		else
			render 'edit'
		end
	end

	def destroy
		@location.destroy
		redirect_to root_path
	end


	private
		def location_params
			params.require(:location).permit(:name, :direction, :phone, :map, :location_img)
		end

		def find_location
			@location = Location.find(params[:id])
		end
end
