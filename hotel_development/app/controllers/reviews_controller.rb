class ReviewsController < ApplicationController

  before_action :check

  def check

    if logged_in? && current_user.user_type == '0'

      render 'admins/strict'
      
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

      flash.notice="Your review was submitted"

      redirect_to reviews_path

    else

      flash.alert = "Comment can't be blank"

      redirect_to reviews_path

    end

  end

  def index

    @reviews = ReviewService.getAllReviews

    if @reviews.count > 0

      @average_review = @reviews.sum('rating') / @reviews.count

    end

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

      flash.notice="Your review was successfully updated"

      redirect_to reviews_path

    else

      flash.alert = "Comment can't be blank"

      redirect_to reviews_path

    end

  end

  def destroy
  
    @review = ReviewService.getReviewByID(params[:id])

    ReviewService.destroyReview(@review)

    flash.alert="Your review was successfully deleted"

    redirect_to reviews_path
    
  end

  private 

  def review_params

    @user_id = current_user.id

    params[:review][:user_id]=  @user_id

    params.require(:review).permit(:comment, :user_id, :rating)
  
  end

end