# frozen_string_literal: true

class RepositoriesController < ApplicationController
  before_action :set_user

  def index
    repos = ReposFetcher.fetch(session[:username])
    @repos = recommend(repos)
  end

  def search
    @search_tag = params.permit(:tag_name)[:tag_name]
    repos = Search.browser(@search_tag, @searched_user)
    repos = @searched_user.repositories if @search_tag.empty?
    @repos = recommend(repos)
    render "repositories/index"
  end

  private

    def set_user
      session[:username] = helpers
                            .sanitize(params[:username])
                            .strip if params[:username]
      @searched_user = searched_user
    end

    def recommend(repos)
      repos_with_recommendations = repos.map do |repo|
        { record: repo, recommendation: Recommendation.get(repo, searched_user) }
      end
      repos_with_recommendations
    end
end
