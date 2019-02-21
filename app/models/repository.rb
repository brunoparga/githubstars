# frozen_string_literal: true

class Repository < ApplicationRecord
  has_many :repository_tags
  has_many :tags, through: :repository_tags
end
