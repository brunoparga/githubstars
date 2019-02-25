# frozen_string_literal: true

module ReposFetcher
  def self.fetch(username)
    user = User.find_by(username: username)
    return user.repositories unless user.nil?
    url = "https://api.github.com/users/#{username}/starred?sort=updated&direction=desc"
    repos = Faraday.get(url).body
    create_repos(repos, username)
  end

  def self.create_repos(repos, username)
    user = User.create(username: username)
    JSON.parse(repos, symbolize_names: true)
      .map { |repo| filter_params(repo) }
      .each { |repo| create_repo(repo, user) }
  end

  def self.filter_params(repo)
    repo[:github_id] = repo[:id]
    repo.slice(*%i[github_id name description html_url language])
  end

  def self.create_repo(repo, user)
    new_repo = Repository.find_or_create_by(repo)
    RepositoryUser.create(repository: new_repo, user: user)
  end
end
