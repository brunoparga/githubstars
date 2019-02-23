# frozen_string_literal: true

class RepositoryTagsController < ApplicationController
  def create
    tag = Tag.find_by(name: tag_params[:name]) || Tag.create(tag_params)
    @repo = Repository.find(params[:repository_id])
    @repo_tag = RepositoryTag.create(repository: @repo, tag: tag)
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
