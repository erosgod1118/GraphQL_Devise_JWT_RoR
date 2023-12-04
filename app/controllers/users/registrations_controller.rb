# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private
    def respond_with(resource, _opts = {})
      if resource.persisted?
        render json: {
          status: {code: 200, message: 'Signed up successfully.'},
          data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
        }
      else
        render json: {
          status: {
            message: resource.errors.full_messages.to_sentence != "" ? "#{resource.errors.full_messages.to_sentence}" : "User removed successfully."
          }}, status: :unprocessable_entity
      end
    end 

end
