class VenuesController < ApplicationController
  def index
    @venues = Venue.where.not(latitude: nil, longitude: nil)

    @markers = @venues.map do |venue|
      {
        lat: venue.latitude,
        lng: venue.longitude#,
        # infoWindow: { content: render_to_string(partial: "/venues/map_box", locals: { venue: venue }) }
      }
    end

    if params[:query].present?
      @venues = Venue.global_search(params[:query])
    else
      @venues = Venue.all
    end
  end
  def show
    @user = current_user
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
    # make sure only owner can change this
    @venue = current_user.venues.find(params[:id])
  end
  def update
    @venue = Venue.find(params[:id])
    @venue.user = current_user
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
