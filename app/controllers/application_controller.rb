# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def render_json(status, json = {})
    render status: status, json: json
  end
end
