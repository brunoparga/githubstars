# frozen_string_literal: true

module Search
  def self.api(query)
    search_tags(query).map do |match|
      { matching_tag: match.name,
        repositories: match.repositories }
    end
  end

  def self.browser(query, user)
    search_tags(query).map { |match| match_repos(match, user) }.flatten
  end

  def self.search_tags(query)
    Tag.where("name ILIKE ?", "#{query}%")
  end

  def self.match_repos(match, user)
    match
      .repository_tags
      .where(user: user, tag: match)
      .map { |repo_tag| repo_tag.repository }
  end
end
