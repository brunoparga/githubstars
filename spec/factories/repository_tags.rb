# frozen_string_literal: true

FactoryBot.define do
  factory :repository_tag do
    repository { nil }
    tag { nil }
    user { nil }
  end
end
