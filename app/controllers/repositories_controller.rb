# frozen_string_literal: true

class RepositoriesController < ApplicationController
  def index
    session[:username] = helpers.sanitize(params[:username]).strip
    @repos = ReposFetcher.fetch(session[:username])
  end

  def search
    @search_tag = params.permit(:tag_name)[:tag_name]
    @searched_user = searched_user
    @repos = Search.browser(@search_tag, @searched_user)
    @repos = @searched_user.repositories if @search_tag.empty?
    render "repositories/index"
  end
end
