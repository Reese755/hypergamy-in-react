class QuestionsController < ApplicationController

    def index
        questions = Question.all
        render json: questions, status: :ok
    end

    def show
        question = Question.find_by(id: params[:id])
        if(question)
            render json: question, status: :ok
        else
            render json: {error: "Question not found"}, status: :not_found
        end
    end

    def update 
        question = Question.find_by(id: params[:id])
        if(question)
            question.update(question_params)
            if(question.valid?)
                render json: question, status: :accepted
            else
                render json: {errors: question.errors.full_messages}, status: :unprocessable_entity
            end
        else
            render json: {error: "Question not found"}, status: :not_found
        end
    end
private

    def question_params
        params.permit(:survey_id, :text)
    end
end

