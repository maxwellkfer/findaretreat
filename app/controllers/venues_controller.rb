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
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    if @venue.save
      venue_path
    else
      render new_user_venue_path
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
    params.require(:venue).permit(:name, :address, :email, :description, :price, :photo)
  end

end
