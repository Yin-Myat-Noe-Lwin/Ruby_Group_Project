class ReviewRepository
  
  class << self
    
    def getAllReviews

      @reviews = Review.all

    end

    def createReview(review)

      @is_review_create = review.save

    end

    def getReviewByID(id)

      @review = Review.find(id)

    end

    def updateReview(review, review_params)

      @is_update_review = review.update(review_params)

    end

    def destroyReview(review)

      review.destroy

    end

  end

end