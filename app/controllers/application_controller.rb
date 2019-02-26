# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user, :searched_user

  private

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def searched_user
      User.find_by(username: session[:username]) || current_user
    end
end
