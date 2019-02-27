# frozen_string_literal: true

module Recommendation
  def self.get(repo, user)
    common_tag = most_common_tag(repo)
    unless user_has_tag?(repo, user, common_tag) || common_tag.nil?
      return common_tag.name
    end
    name_tag = Tag.find_by(name: repo.language.downcase)
    language = repo.language.downcase
    language = "documentation" if language == "undefined"
    return language unless user_has_tag?(repo, user, name_tag)
    "favorite"
  end

  def self.user_has_tag?(repo, user, tag)
    repo
      .repository_tags
      .where(user: user)
      .map { |rt| rt.tag }
      .include? tag
  end

  def self.most_common_tag(repo)
    # TODO: prevent this from being nil
    RepositoryTag
      .where(repository: repo)
      .group(:tag)
      .count
      .max_by { |tag, count| count }
      &.first
  end
end
