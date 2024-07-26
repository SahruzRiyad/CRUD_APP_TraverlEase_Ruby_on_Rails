class BookingController < ApplicationController
#     # before_action :require_login, only: [:new, :create]
  
    def new
      @user = current_user
      @booking = @user.bookings.new
    end
  
#     def create
#       @user = current_user
#       @booking = @user.bookings.new(booking_params)
#       if @booking.save
#         redirect_to user_booking_path(@user, @booking), notice: 'Booking was successfully created.'
#       else
#         render :new
#       end
#     end
  
#     private
  
#     def booking_params
#       params.require(:booking).permit(:booking_type, :booking_datetime, :start_datetime, :end_datetime, :status, :total_price, :payment_status)
#     end
end
  