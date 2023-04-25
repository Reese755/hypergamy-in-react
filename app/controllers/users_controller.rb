class UsersController < ApplicationController
   
        def index 
            users = User.all
            render json: users, status: :ok
        end
    
        
        def show
            user = User.find_by(id: session[:user_id])
            if(user)
                render json: user, serializer: UserShowDataSerializer, status: :ok
            else 
                render json: {error: "Not authorized"}, status: :unauthorized
            end
        end

        def create
            user = User.create(user_params)
            if(user.valid?)
                session[:user_id] = user.id
                render json: user, status: :created
            else
                render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
            end
        end
    
    
        def update 
            user = User.find_by(id: params[:id])
            if(user)
                user.update(user_params)
                if(user.valid?)
                    render json: user, status: :accepted
                else
                    render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
                end
            else
                render json: {error: "User not found"}, status: :not_found
            end
        end
    
        def destroy 
            user = User.find_by(id: params[:id])
            if(user)
                user.destroy 
                head :no_content 
            else 
                render json: { error: "User not found" }, status: :not_found
            end
        end
    
    private 
    
        def user_params
            params.permit(:username, :email, :password, :profile_picture, :name, :location, :age, :height, :weight, :gender)
        end
    end
