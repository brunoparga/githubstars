# frozen_string_literal: true

class RepositoriesController < ApplicationController
  def index
    session[:username] = helpers.sanitize(params[:username]).strip
    @repos = ReposFetcher.fetch(session[:username])
  end

  def search
    @search_tag = params.permit(:tag_name)[:tag_name]
    @repos = Search.browser(@search_tag)
    @repos = user.repos if @search_tag.empty?
    render "repositories/index"
  end
end
