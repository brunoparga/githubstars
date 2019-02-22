# frozen_string_literal: true

class RepositoryTag < ApplicationRecord
  belongs_to :repository
  belongs_to :tag

  delegate :name, to: :tag

  validates :tag, uniqueness: { scope: :repository }
end
