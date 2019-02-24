# frozen_string_literal: true

FactoryBot.define do
  factory :repository do
    github_id { 118747761 }
    name { "factory-bot-created" }
    description { "A sample repo" }
    html_url { "https://github.com/wrong/does-not-exist" }
    language { "ruby" }
  end
end
