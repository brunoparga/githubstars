# frozen_string_literal: true

class Api::RepositoriesController < Api::BaseController
  def index
    [Repository, RepositoryTag].each { |klass| klass.destroy_all }
    @username = helpers.sanitize(params[:username]).strip
    @repos = GithubInteractor.fetch_starred(@username)
    @repos.each { |repo| repo[:language] ||= "undefined" }
  end

  def search
    @search_tag = params.permit(:tag_name)[:tag_name]
    matches = Tag.where("name ILIKE ?", "#{@search_tag}%")
    @repos = matches.map do |match|
      { matching_tag: match.name,
        repositories: match.repositories }
    end
  end
end
