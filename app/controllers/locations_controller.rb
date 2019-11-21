class LocationsController < ApplicationController
	before_action :find_location, only: [:show, :edit, :update, :destroy]
	def index
		if params[:category].blank?
		@location = Location.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @location = Location.where(:category_id => @category_id)
    end

    if params[:search]
      @search_term = params[:search]
      @location = @location.search_by(@search_term)
    end
	end

	def new
		@location = current_user.locations.build
		@categories = Category.all.map{ |c| [c.name, c.id] }
	end

	def show

	end

	def create
		@location = current_user.locations.build(location_params)
    @location.category_id = params[:category_id]
		if @location.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
		@categories = Category.all.map{ |c| [c.name, c.id] }
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

		def search_by(search_term)
			where ("LOWER(name) LIKE :search_term"),
			 search_term: "%#{search_term.downcase}"
		end
end
