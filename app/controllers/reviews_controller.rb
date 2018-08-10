class ReviewsController < ApplicationController
  def create
    @venue = Venue.find(params[:venue_id])
    @review = Review.new(review_params)
    @review.venue = @venue
    if @review.save
      redirect_to venue_path(@venue)
    else
      render 'venues/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end

