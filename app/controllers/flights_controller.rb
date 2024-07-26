class FlightsController < ApplicationController

  def index
      @flights = Flight.page(params[:page]).per(10)
  end
  
  def new
   
  end

  def create
    @flight = Flight.new(flight_params) 
    
    if @flight.save
      flash[:success] = "Flight Successfully added."
      redirect_to show_index_path
    else
      render :new
    end
  end

  def edit
    @flight = Flight.find_by(params[:id])
  end

  def update
    @flight = Flight.find_by(params[:id])
  
    if @flight.update(flight_params)
      flash[:success] = "Flight updated successfully!"
      redirect_to show_index_path(params)
    else
      render :edit
    end
  end
  
  
  def destroy
    @flight = Flight.find(params[:format])
    @flight.destroy
    redirect_to show_index_path, notice: "Flight successfully deleted."
  end
  
  def flightSearch
    if params[:query].present?
      @flights = search_flights(params[:query]).page(params[:page]).per(10)
      render :index
    else 
      redirect_to show_index_path
    end
  end
  
  def search
    @flights = Flight.where(
      start: params[:from],
      destination: params[:to],
    )
    render :results  # Render the index view to display results
  end

  private

  def search_flights(query)
    query = query.downcase
    @flights = Flight.where("LOWER(flight_name) LIKE ? OR LOWER(flight_type) LIKE ? OR LOWER(start) LIKE ? OR LOWER(destination) LIKE ?", 
                            "%#{query}%", 
                            "%#{query}%", 
                            "%#{query}%", 
                            "%#{query}%")
    return @flights
  end
  def flight_params
    # Permitting the custom parameter names from your form
    params.permit(:flight_name, :flight_type, :start, :destination, :departure_time, :total_price) 
  
  end

end
