class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response


    private 

    def render_not_found_response invalid
        render json: {erorr: "#{invalid.model} not found"}
    end

    def render_unprocessable_entity_response invalid
        render json: { errors: invalid.record.errors.full_messages }
    end
end
