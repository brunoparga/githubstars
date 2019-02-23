# frozen_string_literal: true

class RepositoriesController < ApplicationController
  def index
    session[:username] = helpers.sanitize(params[:username]).strip
    GithubInteractor.fetch_starred(session[:username])
    @repos = Repository.all
  end
end
