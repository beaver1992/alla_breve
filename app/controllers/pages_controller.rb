# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @articles = Article.order(published_date: :desc).first(4)
  end
end
