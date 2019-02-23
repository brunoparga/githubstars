# frozen_string_literal: true

json.search_tag @search_tag
json.results @repos do |repo|
  json.matching_tag repo[:matching_tag]
  json.repositories repo[:repositories], *%i[github_id name description html_url language]
end
