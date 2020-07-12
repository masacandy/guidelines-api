module Api
  module V1
    class GuidelinesController < Api::V1::BaseV1Controller
      def index
        guidelines = Guideline.all

        options = {}
        options[:include] = [:steps]

        render json: ::V1::GuidelineSerializer.new(
          guidelines, options
        ).serialized_json, status: :ok
      rescue => e
        Rails.logger.error e

        render_internal_server_error
      end

      def create
        guideline = Guideline.create!(guideline_params)

        render json: ::V1::GuidelineSerializer.new(
          guideline
        ).serialized_json, status: :created
      rescue => e
        Rails.logger.error e

        render_internal_server_error
      end

      def show
        options = {}
        options[:include] = [:steps]

        render json: ::V1::GuidelineSerializer.new(
          guideline, options
        ).serialized_json, status: :ok
      rescue => e
        Rails.logger.error e

        render_internal_server_error
      end

      def update
        guideline.update!(guideline_params)

        options = {}
        options[:include] = [:steps]

        render json: ::V1::GuidelineSerializer.new(
          guideline, options
        ).serialized_json, status: :ok
      rescue => e
        Rails.logger.error e

        render_internal_server_error
      end

      def destroy
        guideline.destroy!
        render json: {}, status: :ok
      rescue => e
        Rails.logger.error e

        render_internal_server_error
      end

      private

      def guideline
        @guideline ||= Guideline.find_by(display_id: params[:display_id])
      end

      def guideline_params
        params.require(:guideline).permit(:title, :description)
      end
    end
  end
end
