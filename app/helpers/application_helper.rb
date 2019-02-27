# frozen_string_literal: true

module ApplicationHelper
  def owner?
    return false if current_user.nil?
    session[:username] == current_user.username
  end

  def message(repos, search_tag)
    if @repos.empty? && @search_tag && owner?
      :empty_search_own
    elsif @repos.empty? && owner?
      :no_own_starred_repos
    elsif owner?
      :found_own_repos
    elsif @repos.empty? && @search_tag
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
