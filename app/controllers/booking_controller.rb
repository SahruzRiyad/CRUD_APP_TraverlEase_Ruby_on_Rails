class BookingController < ApplicationController
#     before_action :require_login, only: [:new, :create]
  
  def index
    @bookings = Booking.page(params[:page]).per(10)
  end

  def new

  end

  def edit
    @booking = Booking.find_by(params[:id])
  end

  def update
    @booking = Booking.find_by(params[:id])

    if @booking.update(booking_params)
        flash[:success] = "Booking updated successfully!"
        redirect_to show_booking_index_path
    else
        render :edit
    end
  end


  def destroy
    @booking = Booking.find(params[:format])
    @booking.destroy
    redirect_to show_booking_index_path, notice: "Booking successfully deleted."
  end

  def bookingSearch
    if params[:query].present?
        @bookings = search_bookings(params[:query]).page(params[:page]).per(10)
        render :index
    else 
        redirect_to show_booking_index_path
    end
  end


  private

    def search_bookings(query)
      query = "%#{params[:query]}%"
      @bookings = Booking.where(
        'CAST(id AS TEXT) LIKE ? OR 
        CAST(user_id AS TEXT) LIKE ? OR 
        booking_type LIKE ? OR 
        CAST(start_datetime AS TEXT) LIKE ? OR 
        CAST(end_datetime AS TEXT) LIKE ? OR 
        status LIKE ? OR 
        CAST(total_price AS TEXT) LIKE ? OR 
        payment_status LIKE ?', 
        query, query, query, query, query, query, query, query
      )
      
      return @bookings
    end

    def booking_params
        # Permitting the custom parameter names from  form
        params.permit(:booking_type, :start_datetime, :end_datetime, :status, :total_price, :payment_status) 
    end

end
  