# frozen_string_literal: true

class RepositoryTagsController < ApplicationController
  def create
    tag = Tag.find_by(name: params[:name]) || Tag.create(tag_params)
    repo = Repository.find(params[:repository_id])
    RepositoryTag.create(repository: repo, tag: tag)
    @repository_tag = RepositoryTag.new
    @repos = params[:repo_ids].split.map { |id| Repository.find(id.to_i) }
    @username = params[:username]
    render "repositories/index"
  end

  def destroy
    @id = params[:id]
    RepositoryTag.find(@id).destroy
  end

  private

    def tag_params
      params.permit(:name)
    end
end
