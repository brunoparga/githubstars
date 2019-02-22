# frozen_string_literal: true

json.repository_name @repo.name
json.tag_list @repo.repository_tags do |tag|
  json.tag_name tag.name
end
