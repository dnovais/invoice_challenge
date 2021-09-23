# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def render_json(status, json = {})
    render status: status, json: json
  end
end
