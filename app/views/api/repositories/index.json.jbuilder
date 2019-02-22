# frozen_string_literal: true

json.username @username
json.repositories @repos, *%i[id name description html_url language]
