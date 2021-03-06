# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :repository_tags, dependent: :destroy
  has_many :repositories, through: :repository_tags

  validates :name, presence: true, uniqueness: true
end
