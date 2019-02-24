# frozen_string_literal: true

module Search
  def self.search_tags(query)
    matches = Tag.where("name ILIKE ?", "#{query}%")
    matches.map do |match|
      { matching_tag: match.name,
        repositories: match.repositories }
    end
  end
end
