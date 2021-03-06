# frozen_string_literal: true

class Api::RepositoriesController < Api::BaseController
  def index
    [Repository, RepositoryTag].each { |klass| klass.destroy_all }
    @username = helpers.sanitize(params[:username]).strip
    @repos = ReposFetcher.fetch(@username)
    @repos.each { |repo| repo[:language] ||= "undefined" }
  end

  def search
    @search_tag = params.permit(:tag_name)[:tag_name]
    @repos = Search.api(@search_tag)
  end
end
