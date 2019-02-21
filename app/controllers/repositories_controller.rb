# frozen_string_literal: true

class RepositoriesController < ApplicationController
  def index
    username = helpers.sanitize(params[:username]).strip
    @repos = GithubInteractor.fetch_starred(username)
    @repos.each { |repo| Repository.create(repo) }
  end
end
