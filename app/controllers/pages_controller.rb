# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    # visiting home cleans up the database of other users' repos
    Repository.destroy_all
    Tag.destroy_all
  end

  def repos
    username = helpers.sanitize(params[:username]).strip
    @repos = GithubInteractor.fetch_starred(username)
    @repos.each { |repo| Repository.create(repo) }
  end
end
