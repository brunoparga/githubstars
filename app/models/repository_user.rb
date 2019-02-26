# frozen_string_literal: true

class RepositoryUser < ApplicationRecord
  belongs_to :repository
  belongs_to :user

  validates :user, uniqueness: { scope: :repository }
end
