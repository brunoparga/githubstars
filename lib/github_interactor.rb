# frozen_string_literal: true

module GithubInteractor
  def self.fetch_starred(username)
    url = "https://api.github.com/users/#{username}/starred?sort=updated&direction=desc"
    starred_repos = RestClient.get(url)
    JSON.parse(starred_repos, symbolize_names: true)
      .map { |repo| repo.slice(*%i[id name description html_url language]) }
      .each { |repo| repo[:github_id] = repo.delete(:id) }
  end
end
