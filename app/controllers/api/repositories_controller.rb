# frozen_string_literal: true

class Api::RepositoriesController < Api::BaseController
  def index
    [Repository, RepositoryTag].each { |klass| klass.destroy_all }
    @username = helpers.sanitize(params[:username]).strip
    @repos = GithubInteractor.fetch_starred(@username)
    @repos.each { |repo| repo[:language] ||= "undefined" }
  end

  def search
    @query = params.permit(:tag_name)[:tag_name]
    @repos = Repository
               .joins(:repository_tags)
               .joins(:tags)
               .where("tags.name ILIKE ?", "#{@query}%")
  end
end
