class HotelController < ApplicationController

    def index
        @hotels = Hotel.page(params[:page]).per(10)
    end

    def new

    end

    def create
        @hotel = Hotel.new(hotel_params) 

        if @hotel.save
            flash[:success] = "Hotel Successfully added."
            redirect_to show_hotel_index_path
        else
            render :new
        end
    end

    def edit
        @hotel = Hotel.find_by(params[:id])
    end

    def update
        @hotel = Hotel.find_by(params[:id])

        if @hotel.update(hotel_params)
            flash[:success] = "Hotel updated successfully!"
            redirect_to show_hotel_index_path
        else
            render :edit
        end
    end


    def destroy
        @hotel = Hotel.find(params[:format])
        @hotel.destroy
        redirect_to show_hotel_index_path, notice: "Hotel successfully deleted."
    end

    def hotelSearch
        if params[:query].present?
            @hotels = search_hotels(params[:query]).page(params[:page]).per(10)
            render :index
        else 
            redirect_to show_hotel_index_path
        end
    end

    def search
        @hotels = Hotel.where(
            location: params[:location],
            rating: params[:rating]
        ).where('available_rooms >= ?', params[:available_rooms].to_i)
        render :results  # Render the index view to display results
    end

    private

        def search_hotels(query)
            query = query.downcase
            @hotels = Hotel.where("LOWER(name) LIKE ? OR LOWER(location) LIKE ?", 
                    "%#{query}%", 
                    "%#{query}%")
            return @hotels
        end

        def hotel_params
            # Permitting the custom parameter names from your form
            params.permit(:name, :location, :rating, :available_rooms, :price_per_night) 
        end

end

