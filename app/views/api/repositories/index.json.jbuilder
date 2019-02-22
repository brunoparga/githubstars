# frozen_string_literal: true

json.username @username
json.repositories @repos, *%i[github_id name description html_url language]
