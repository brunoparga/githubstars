# frozen_string_literal: true

class Api::RepositoryTagsController < Api::BaseController
  before_action :set_repository

  def create
    name = permitted_params[:tag_name]
    tag = Tag.find_by(name: name) || Tag.create(name: name)
    RepositoryTag.create(repository: @repo, tag: tag)
    response
      .set_header("Location", "repositories/#{permitted_params[:repository_id]}")
    render :create, status: :created
  end

  def recommend
    @repo = Repository.find_by(github_id: params[:repository_id])
    @recommendations = [@repo.language.downcase]
    @recommendations = ["documentation"] if @recommendations == ["undefined"]
  end

  private

    def set_repository
      @repo =
        Repository
        .find_by(github_id: permitted_params[:repository_id])
    end

    def permitted_params
      params.permit(:repository_id, :tag_name)
    end
end
