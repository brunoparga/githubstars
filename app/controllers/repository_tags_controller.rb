# frozen_string_literal: true

class RepositoryTagsController < ApplicationController
  def create
    @repo_tag = RepositoryTag.create(repository_id: params[:repository_id],
                                     tag: set_tag,
                                     user: searched_user)
    @repo = Repository.find(params[:repository_id])
    @recommendation = Recommendation.get(@repo, searched_user)
  end

  def destroy
    @id = params[:id]
    RepositoryTag.find(@id).destroy
  end

  private

    def set_tag
      Tag.find_by(name: params.permit(:name)[:name]) || Tag.create(params.permit(:name))
    end
end
