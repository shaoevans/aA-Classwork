class ApplicationController < ActionController::Base
    helper_method :current_user, :login!, :logged_in?, :give_current_user

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def login!(user)
        session[:session_token] = user.reset_session_token!
    end

    def give_current_user
        @current_user
    end

    def logged_in? 
        !!current_user
    end

    def require_logged_in
        redirect_to cats_url if logged_in?
    end
end
