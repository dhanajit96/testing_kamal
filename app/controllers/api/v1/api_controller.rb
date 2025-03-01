# frozen_string_literal: true

module Api
    module V1
      class ApiController < ActionController::Base
        before_action :authenticate_user!

        rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
        rescue_from ActionController::ParameterMissing, with: :bad_request
        rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity
        # rescue_from CanCan::AccessDenied, with: :unauthorized


        def authenticate_user!
            begin
              token = request.headers["Authorization"].split(" ").last
              payload = JsonWebToken.decode(token)
              @current_user = AuthenticationToken.find_by(id: payload["token_id"]).user

              if @current_user.nil?
                render json: { success: false, errors: [ "User is deleted or not found" ] }, status: :unauthorized
              end
            rescue
              render json: { success: false, errors: [ "Authorization header not valid" ] }, status: :unauthorized
            end
        end

        def current_user
            @current_user
        end

        protected

        def record_not_found
          render json: { success: false, errors: [ "Record Not Found" ] }, status: 404
        end

        def bad_request
          render json: { success: false, errors: [ "Bad Request" ] }, status: 400
        end

        def unprocessable_entity
          render json: { success: false, errors: [ "Unprocessable Entity" ] }, status: 422
        end

        def unauthorized
          render json: { success: false, errors: [ "You Are Not Authorized To Perform This Action" ] }, status: 401
        end
      end
    end
end
