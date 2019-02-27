# frozen_string_literal: true

module Recommendation
  def self.get(repo)
    name_tag = Tag.find_by(name: repo.language.downcase)
    language = repo.language.downcase
    language = "documentation" if language == "undefined"
    return language unless repo.tags.include? name_tag
    "favorite"
  end
end
