# frozen_string_literal: true

class Api::RepositoriesController < Api::BaseController
  def index
    @username = helpers.sanitize(params[:username]).strip
    @repos = GithubInteractor.fetch_starred(@username)
    @repos.each { |repo| repo[:language] ||= "undefined" }
  end
end
