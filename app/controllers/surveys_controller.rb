class SurveysController < ApplicationController
    
    def index 
    surveys = Survey.all
    render json: surveys, status: :ok
    end

    def show
        survey = Survey.find_by(id: params[:id])
        if(survey)
            render json: survey, status: :ok
        else
            render json: {error: "Survey not found"}, status: :not_found
        end
    end

    def update 
        survey = Survey.find_by(id: params[:id])
        if(survey)
            survey.update(survey_params)
            if(survey.valid?)
                render json: survey, status: :accepted
            else
                render json: {errors: survey.errors.full_messages}, status: :unprocessable_entity
            end
        else
            render json: {error: "Survey not found"}, status: :not_found
        end
    end
private

    def survey_params
        params.permit(:user_id, :description)
    end
end
