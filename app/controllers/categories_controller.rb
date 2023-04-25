class CategoriesController < ApplicationController

    def index
        categories = Category.all
        render json: categories, status: :ok
    end

    def show
        category = Category.find_by(id: params[:id])
        if(category)
            render json: category, status: :ok
        else
            render json: {error: "Category not found"}, status: :not_found
        end
    end

    def update 
        category = Category.find_by(id: params[:id])
        if(category)
            category.update(category_params)
            if(category.valid?)
                render json: category, status: :accepted
            else
                render json: {errors: category.errors.full_messages}, status: :unprocessable_entity
            end
        else
            render json: {error: "Category not found"}, status: :not_found
        end
    end
private

    def category_params
        params.permit(:user_id, :rating_id, :age_range, :gender, :location)
    end
end