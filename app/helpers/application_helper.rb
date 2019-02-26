# frozen_string_literal: true

module ApplicationHelper
  def tags(repo, user)
    repo.repository_tags.select { |repo_tag| repo_tag.user == user }
  end
end
