module Api
  module V1
    class StepsController < Api::V1::BaseV1Controller
      def create
        step = guideline.steps.create!(step_params)

        render json: ::V1::StepSerializer.new(
          step
        ).serialized_json, status: :created
      rescue => e
        Rails.logger.error e

        render_internal_server_error
      end

      def update
        step.update!(step_params)

        render json: ::V1::StepSerializer.new(
          step
        ).serialized_json, status: :ok
      rescue => e
        Rails.logger.error e

        render_internal_server_error
      end

      def destroy
        step.destroy!

        render json: ::V1::StepSerializer.new(
          step
        ).serialized_json, status: :ok
      rescue => e
        Rails.logger.error e

        render_internal_server_error
      end

      private

      def guideline
        @guideline ||= Guideline.find_by(display_id: params[:guideline_display_id])
      end

      def step
        @step ||= guideline.steps.find_by(display_id: params[:display_id])
      end

      def step_params
        params.require(:step).permit(:display_id, :title, :position, :description, :remark)
      end
    end
  end
end
