# frozen_string_literal: true

module Api
  class BaseApiController < ApplicationController
    def render_internal_server_error
      error = { details: 'internal server error', status: :internal_server_error }
      render_error(errors: [error], status: :internal_server_error)
    end

    def render_error(errors:, status:)
      render json: ::V1::ErrorSerializer.new(errors).serialized_json,
             status: status,
             layout: false
    end
  end
end
