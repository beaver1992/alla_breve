# frozen_string_literal: true

module Admin
  class BaseController < ActionController::Base
    protect_from_forgery with: :exception

    layout 'admin'
  end
end
