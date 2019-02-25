# frozen_string_literal: true

module GithubInteractor
  def self.fetch_starred(username)
    if %w[brunoparga ssaunier gustavohenrique].include? username
      starred_repos = File.read("#{username}")
    else
      url = "https://api.github.com/users/#{username}/starred?sort=updated&direction=desc"
      starred_repos = Faraday.get(url).body
    end
    JSON.parse(starred_repos, symbolize_names: true)
      .map { |repo| repo.slice(*%i[id name description html_url language]) }
      .each do |repo|
        repo[:github_id] = repo.delete(:id)
        Repository.create(repo)
      end
  end
end
