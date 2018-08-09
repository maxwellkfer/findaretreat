class VenuesController < ApplicationController
  def index
    if params[:category]
      @venues = Venue.joins(:category).where("categories.name LIKE ?", "%#{params[:category]}%")
    else
      @venues = Venue.all
    end
  end

  def show
    @venue = Venue.find(params[:id])
    @booking = Booking.new
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    @venue.user = current_user
    if @venue.save
      redirect_to @venue
    else
      render :new
    end
  end

  def edit
    @venue = Venue.find(params[:id])
  end

  def update
    @venue = Venue.find(params[:id])
    @venue.update(venue_params)
    redirect_to venue_path
  end

  def destroy
    @venue= Venue.find(params[:id])
    @venue.destroy
    redirect_to venues_path
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :address, :email, :description, :price, :photo_cache, :category_id, :photo)
  end

end
