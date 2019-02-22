# frozen_string_literal: true

class RepositoriesController < ApplicationController
  def index
    @username = helpers.sanitize(params[:username]).strip
    GithubInteractor.fetch_starred(@username)
    @repos = Repository.all
    @repository_tag = RepositoryTag.new
  end
end
