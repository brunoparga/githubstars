# frozen_string_literal: true

module ApplicationHelper
  def message(repos, search_tag)
    if @repos.empty? && @search_tag
      :empty_search
    elsif @repos.empty?
      :no_starred_repos
    else
      :found_repos
    end
  end

  def tags(repo, user)
    repo.repository_tags.select { |repo_tag| repo_tag.user == user }
  end
end
