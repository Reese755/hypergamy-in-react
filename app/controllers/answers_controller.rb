class AnswersController < ApplicationController

    def index
        answers = Answer.all
        render json: answers, status: :ok
    end

    def show
        answer = Answer.find_by(id: params[:id])
        if(answer)
            render json: answer, status: :ok
        else
            render json: {error: "Answer not found"}, status: :not_found
        end
    end

    def update 
        answer = Answer.find_by(id: params[:id])
        if(answer)
            answer.update(answer_params)
            if(answer.valid?)
                render json: answer, status: :accepted
            else
                render json: {errors: answer.errors.full_messages}, status: :unprocessable_entity
            end
        else
            render json: {error: "Answer not found"}, status: :not_found
        end
    end
private

    def answer_params
        params.permit(:user_id, :question_id, :text)
    end
end