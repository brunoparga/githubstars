# frozen_string_literal: true

json.repository_name @repo.name
json.recommended_tags @recommendations do |recommendation|
  json.recommended_tag recommendation
end
