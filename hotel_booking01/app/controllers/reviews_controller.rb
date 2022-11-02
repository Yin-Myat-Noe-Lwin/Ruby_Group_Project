class ReviewsController < ApplicationController

  before_action :check

  def check

    if logged_in? && current_user.user_type == '0'
      #raise ActionController::RoutingError, 'Not Found'
      render 'review_strict'
      
    end

  end
  
  def new

    if logged_in?

    @review = Review.new

    else

      render 'sessions/loginForm'

    end

  end

  def create

    @review = Review.new(review_params)

    @is_review_create = ReviewService.createReview(@review)

    if @is_review_create 

      flash.notice="Sign up successful"

      redirect_to root_path

    else

      render 'new'

    end

  end

  def index

    @reviews = ReviewService.getAllReviews

  end
  
  def edit

    @is_valid_user_id = ReviewService.getReviewByID(params[:id])

    if logged_in? && @is_valid_user_id.user_id == current_user.id

    @review = ReviewService.getReviewByID(params[:id])

    else

      render 'sessions/loginForm'
      
    end

  end

  def update

    @review = ReviewService.getReviewByID(params[:id])
    
    @is_review_update = ReviewService.updateReview(@review, review_params )

    if @is_review_update

      redirect_to root_path

    else

      flash.notice = "Something wrong"

    end

end

def destroy
  @review = ReviewService.getReviewByID(params[:id])

  ReviewService.destroyReview(@review)
end

  private 

  def review_params

    @user_id = current_user.id

    params[:review][:user_id]=  @user_id

    params.require(:review).permit(:comment, :user_id, :rating)
  
  end

end