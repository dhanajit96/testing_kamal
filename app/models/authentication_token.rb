class AuthenticationToken < ApplicationRecord
  belongs_to :user
  before_create :set_token

  TOKEN_TYPES = %w[App ResetPassword].freeze

  def self.get_user(token)
    where(token: token).first.user
  rescue StandardError
    nil
  end

  def self.create_token(user, type)
    return unless TOKEN_TYPES.include?(type)

    user.authentication_tokens.where(token_type: type).first_or_create
  end

  def self.reset_old_token(user, type)
    return unless TOKEN_TYPES.include?(type)
    begin
      user.authentication_tokens.where(token_type: type).first.reset_token
    rescue StandardError
      nil
    end
  end

  def set_token
    self.token = Devise.friendly_token(25)
  end

  def reset_token
    update(token: Devise.friendly_token(25))
    self
  end
end