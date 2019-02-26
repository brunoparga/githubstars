# frozen_string_literal: true

class RepositoryTag < ApplicationRecord
  belongs_to :repository
  belongs_to :tag
  belongs_to :user

  delegate :name, to: :tag

  validates :tag, uniqueness: { scope: [:repository, :user] }
  validate :user_has_repository

  private

    def user_has_repository
      unless user.repositories.include? repository
        errors.add(:tag, "cannot be placed on someone else's repository")
      end
    end
end
