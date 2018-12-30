class StatusController < ApplicationController
  skip_before_action :authorize_request

  def check
    response = { alive: true }
    json_response(response, :ok)
  end
end
