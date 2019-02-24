# frozen_string_literal: true

module Search
  def self.api(query)
    search_tags(query).map do |match|
      { matching_tag: match.name,
        repositories: match.repositories }
    end
  end

  def self.browser(query)
    search_tags(query).map { |match| match.repositories }.flatten
  end

  def self.search_tags(query)
    Tag.where("name ILIKE ?", "#{query}%")
  end
end
