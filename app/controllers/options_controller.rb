class OptionsController < ApplicationController

    def index
        options = Option.all
        render json: options, status: :ok
    end

    def show
        option = option.find_by(id: params[:id])
        if(option)
            render json: option, status: :ok
        else
            render json: {error: "Option not found"}, status: :not_found
        end
    end

    def update 
        option = Option.find_by(id: params[:id])
        if(option)
            option.update(option_params)
            if(option.valid?)
                render json: option, status: :accepted
            else
                render json: {errors: option.errors.full_messages}, status: :unprocessable_entity
            end
        else
            render json: {error: "Option not found"}, status: :not_found
        end
    end
private

    def option_params
        params.permit(:question_id, :text)
    end
end
