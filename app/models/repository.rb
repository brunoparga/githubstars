# frozen_string_literal: true

class Repository < ApplicationRecord
  has_many :repository_users, dependent: :destroy
  has_many :users, through: :repository_users
  has_many :repository_tags, dependent: :destroy
  has_many :tags, through: :repository_tags

  before_validation { self.language = "undefined" if self.language.nil? }

  %i[github_id name html_url language].each do |attr|
    validates attr, presence: true
  end

  validates :github_id, uniqueness: true, numericality: { only_integer: true }

  default_scope { includes(:tags) }
end
