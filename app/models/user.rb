# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                    :integer          not null, primary key
#  first_name            :string
#  last_name             :string
#  login                 :string
#  password              :string
#  email                 :string
#  phone                 :string
#  country_code          :string
#  blocked_at            :datetime
#  failed_attempt_count  :integer
#  role                  :integer
#  activated_at          :datetime
#  last_login_at         :datetime
#  last_login_ip         :string
#  reset_password_token  :string
#  reset_passwrd_sent_at :datetime
#  sign_in_count         :integer
#  current_sign_in_ip    :string
#  auth_token            :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class User < ApplicationRecord
  attr_accessor :password_confirmation
  attr_accessor :current_password

  enum role: %i[admin customer]

  validates :first_name, :last_name, :email, :phone, :country_code, presence: :true
  validates :phone, length: { minimum: 9, maximum: 15 }, uniqueness: { case_sensitive: false }
  validates :country_code, length: { minimum: 1, maximum: 4 }
  validates :email, uniqueness: { case_sensitive: false }, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]{2,}\z/ }
  validate :password_confirmation_validation

  before_validation :format_phone, :format_country_code, :downcase_email

  class << self
    def current_user=(user)
      Thread.current[:current_user] = user
    end

    def current_user
      Thread.current[:current_user]
    end
  end

  private

  def downcase_email
    self.email = email.mb_chars.downcase
  end

  def format_phone
    self.phone = phone.gsub(/[^0-9]/, '')
  end

  def format_country_code
    self.country_code = '+' + country_code.gsub(/[^0-9]/, '')
  end

  def password_confirmation_validation
    errors.add(:password, ' не совпадает с подтверждением') if password != password_confirmation
  end
end
