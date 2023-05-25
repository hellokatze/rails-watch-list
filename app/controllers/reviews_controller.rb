class ReviewsController < ApplicationController
  before_action :set_movie

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.movie = @movie
    if @review.save
      redirect_to movie_path(@movie)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
