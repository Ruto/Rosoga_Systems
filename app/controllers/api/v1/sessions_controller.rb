    class Api::V1::SessionsController < Api::V1::ApiController
        protect_from_forgery with: :null_session
        acts_as_token_authentication_handler_for User, fallback: :none

        def show
          current_user ? head(:ok) : head(:unauthorized)
        end

       def create
           if params[:email]
             @user = User.where(email: params[:email]).first
           else
             @user = User.where(email: params[:username]).first if params[:username]
           end

           if @user&.valid_password?(params[:password])
              render json: @user.as_json(only: [:id, :email, :authentication_token]), status: :created
            elsif @user != nil
              render json: {status: :unauthorized, code: 4001, message: "Password is incorrect"}   
            elsif @user == nil
              render json: {status: "error", code: 4000, message: "Username is incorrect"}

            end

       end

       def destroy
          if nilify_token && current_user.save
            head(:ok)
          else
            head(:unauthorized)
          end
       end

       private

       def nilify_token
         current_user&.authentication_token = nil
       end

    end
