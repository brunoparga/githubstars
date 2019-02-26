# frozen_string_literal: true

module Recommendation
  def self.get(repo)
    name_tag = Tag.find_by(name: repo.language.downcase)
    return repo.language.downcase unless repo.tags.include? name_tag
    "favorite"
  end
end
