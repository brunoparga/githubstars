# frozen_string_literal: true

json.repository_name @repo.name
json.suggested_tags do
  json.recommended_tag @recommendation
end
