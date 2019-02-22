# frozen_string_literal: true

class Api::RepositoryTagsController < Api::BaseController
  def recommend
    @repo = Repository.find_by(github_id: params[:repository_id])
    @recommendation = @repo.language.downcase
    @recommendation = "documentation" if @recommendation == "undefined"
  end
end
