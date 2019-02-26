# frozen_string_literal: true

class PagesController < ApplicationController
  def home
  end

  def api_doc
    render layout: false
  end
end
