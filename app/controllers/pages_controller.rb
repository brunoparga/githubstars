# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    # visiting home cleans up the database of other users' repos
    Repository.destroy_all
  end

  def api_doc
    render layout: false
  end
end
