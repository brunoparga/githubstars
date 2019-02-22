# frozen_string_literal: true

json.search_tag @query
json.results @repos, *%i[github_id name description html_url language]
