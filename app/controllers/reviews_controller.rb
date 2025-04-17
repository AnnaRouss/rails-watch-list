class ReviewsController < ApplicationController
  def create
    def create
      @list = List.find(params[:list_id])
      @review = @list.reviews.build(review_params)
      if @review.save
        redirect_to list_path(@list), notice: 'Thanks for your feedback!'
      else
      @bookmark = Bookmark.new
      render 'lists/show', status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to list_path(@review.list)
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
