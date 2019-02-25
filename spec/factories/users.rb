# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    provider { "MyString" }
    uid { "MyString" }
    username { "MyString" }
  end
end
