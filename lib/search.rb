# frozen_string_literal: true

module Search
  def self.api(query)
    matching_tags(query).map do |match|
      { matching_tag: match.name,
        repositories: match.repositories }
    end
  end

  def self.browser(raw_query, user)
    queries = process_query(raw_query)
    return queries if queries.empty?
    return query_repos(queries.first, user) if queries.length == 1
    complex_query(queries, user)
  end

  private

    def self.matching_tags(query)
      Tag.where("name ILIKE ?", "%#{query}%")
    end

    def self.process_query(raw_query)
      queries = raw_query.split(/[\W]/).select { |str| str =~ /\w/ }
      queries
    end

    def self.query_repos(query, user)
      matching_tags(query)
              .map { |match| match_repos(match, user) }
              .flatten
    end

    def self.match_repos(match, user)
      match
        .repository_tags
        .where(user: user, tag: match)
        .map { |repo_tag| repo_tag.repository }
    end

    def self.complex_query(queries, user)
      and_repos = repos_with_all_tags(queries, user)
      return and_repos unless and_repos.empty?
      repos_with_any_tag(queries, user)
    end

    def self.repos_with_all_tags(queries, user)
      # words in the query must exactly match tag names
      tags = queries.map { |query| Tag.find_by(name: query) }
      return [] unless tags.all?
      tags.map(&:repositories).inject(:&)
    end

    def self.repos_with_any_tag(queries, user)
      matches = queries.map { |query| matching_tags(query) }.flatten
      matches.map { |match| match_repos(match, user) }.flatten.uniq
    end
end
