# frozen_string_literal: true

module ReposFetcher
  def self.fetch(username)
    user = User.find_by(username: username)
    return user.repositories unless user.nil?
    repos = call_api(username)
    create_repos(repos, username)
  end

  def self.call_api(username)
    url = "https://api.github.com/users/#{username}/starred?sort=updated&direction=desc"
    Faraday.get(url).body
  end

  def self.create_repos(repos, username)
    user = User.create(username: username)
    JSON.parse(repos, symbolize_names: true)
      .map { |repo| create_repo(filter_params(repo)) }
      .each { |repo| link_to_user(repo, user) }
  end

  def self.filter_params(repo)
    repo[:github_id] = repo[:id]
    repo.slice(*%i[github_id name description html_url language])
  end

  def self.create_repo(repo)
    Repository.find_by(github_id: repo[:github_id]) || Repository.create(repo)
  end

  def self.link_to_user(repo, user)
    RepositoryUser.create(repository: repo, user: user)
  end
end
