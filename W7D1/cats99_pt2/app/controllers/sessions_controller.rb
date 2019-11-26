class SessionsController < ApplicationController
    before_action :require_logged_in, only: [:new]
    def new
        render :new
    end

    def create
        @user = User.find_by_credentials(params[:user][:user_name],params[:user][:password])
        if @user
            session[:session_token] = @user.reset_session_token!
            redirect_to cats_url
        else
            flash[:errors] = "Invalid Username and Password"
            redirect_to new_session_url
        end
    end

    def destroy
        current_user.reset_session_token!
        @current_user = nil
        session[:session_token] = nil
        redirect_to new_session_url
    end
end
