class ReviewService

  class << self

    def getAllReviews

      @reviews = ReviewRepository.getAllReviews

    end

    def createReview(review)

     @is_review_create = ReviewRepository.createReview(review)

    end

    def getReviewByID(id)

      @review = ReviewRepository.getReviewByID(id)

    end

    def updateReview(review, review_params)

      @is_review_update = ReviewRepository.updateReview(review, review_params)

    end

    def destroyReview(review)

      ReviewRepository.destroyReview(review)

    end

  end

end