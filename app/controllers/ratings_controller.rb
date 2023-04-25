class RatingsController < ApplicationController

    def index
        ratings = Rating.all
        render json: ratings, status: :ok
    end

   def show
    rating = Rating.find_by(id: params[:id])
        if(rating)
            render json: rating, status: :ok
        else 
            render json:{error: "Rating not found"}, status: :not_found
        end
    end

    def create
        rating = Rating.create(rating_params)
        if(rating.valid?)
            render json: rating, status: :created
        else 
            render json: {errors: rating.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update 
        rating = Rating.find_by(id: params[:id])
        if(rating)
            rating.update(rating_params)
            if(rating.valid?)
                render json: rating, status: :accepted
            else
                render json: {errors: rating.errors.full_messages}, status: :unprocessable_entity
            end
        else
            render json: {error: "Rating not found"}, status: :not_found
        end
    end

    private

    def rating_params
        params.permit(:rating_for_user, :value, :user_id)
    end
end
