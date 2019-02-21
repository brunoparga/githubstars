# frozen_string_literal: true

class PagesController < ApplicationController
  def home; end

  def repos
    username = helpers.sanitize(params[:username]).strip
    url = "https://api.github.com/users/#{username}/starred?sort=updated&direction=desc"
    @repos =
      JSON.parse(RestClient.get(url), symbolize_names: true)
      .map { |repo| repo.slice(*%i[id name description html_url language]) }
  end
end
