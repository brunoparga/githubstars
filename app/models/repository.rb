# frozen_string_literal: true

class Repository < ApplicationRecord
  has_many :repository_users, dependent: :destroy
  has_many :user, through: :repository_users
  has_many :repository_tags, dependent: :destroy
  has_many :tags, through: :repository_tags

  before_validation { self.language = "undefined" if self.language.nil? }

  %i[github_id name description html_url language].each do |attr|
    validates attr, presence: true
  end

  %i[github_id name html_url].each do |attr|
    validates attr, uniqueness: true
  end

  validates :github_id, numericality: { only_integer: true }
end
