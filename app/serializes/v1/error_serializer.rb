module V1
  class ErrorSerializer
    attr_reader :errors

    def initialize(errors)
      @errors = errors
    end

    def serialized_json
      object.to_json
    end

    private

    # https://gist.github.com/mlanett/a31c340b132ddefa9cca
    def status_code(status)
      case status
      when :bad_request
        400
      when :unauthorized
        401
      when :forbidden
        403
      when :not_found
        404
      when :unprocessable_entity
        422
      when :internal_server_error
        500
      end
    end

    def object
      { errors: error_objects }
    end

    def error_objects
      errors.each_with_object([]) do |error, array|
        array.push(hash(error))
      end
    end

    def hash(error)
      h = { status: status_code(error[:status]).to_s, detail: error[:detail] }
      h.merge!(source: error[:source]) if error[:source].present?
      h.merge!(title: error[:title]) if error[:title].present?
      h
    end
  end
end
