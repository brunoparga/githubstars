# frozen_string_literal: true

FactoryBot.define do
  factory :repository do
    github_id { 118746761 }
    name { "challenge-development" }
    description { "A cool development challenge for our awesome future team" }
    html_url { "https://github.com/brainn-co/challenge-development" }
    language { "undefined" }
  end
end
