# frozen_string_literal: true
#test qweqweqwe qwewe123234
require './api/graphql/graph'

# this is a user graph api class
#
class User < Graphql
  def user_signup(payload, locale = false)
    query = <<-GRAPHQL
    mutation signup(
      $input: UserSignUpInput!
    ) {
        userSignUp(
          input: $input
        ) {
        authToken
        }
      }
    GRAPHQL
    graph_request(query, false, locale, payload)
  end

  def user_login(payload)
    query = <<-GRAPHQL
    mutation login(
      $input: UserLoginInput!
    ) {
        userLogin(
          input: $input
        ) {
        authToken
        }
      }
    GRAPHQL
    graph_request(query, false, false, payload)
  end

  def send_phone_code(phone, type, locale = false)
    query = <<-GRAPHQL
    mutation send_phone_code {
      sendPhoneCode(
        phone: "#{phone}",
        type: #{type}
      ) {
        success
      }
    }
    GRAPHQL
    graph_request(query, false, locale)
  end

  def check_user_exist(type, value)
    query = <<-GRAPHQL
    query check_user_exist {
      checkUserExist(
        type: #{type},
        value: "#{value}"
      ) {
        exist
      }
    }
    GRAPHQL
    graph_request(query)
  end

  def forgot_password(email, locale = false)
    query = <<-GRAPHQL
    mutation forgot_password {
      forgotPassword(
        email: "#{email}"
      ) {
        success
      }
    }
    GRAPHQL
    graph_request(query, false, locale)
  end

  def reset_password(reset_password_token, new_password)
    query = <<-GRAPHQL
    mutation reset_password {
      resetPassword(
        token: "#{reset_password_token}",
        newPassword: "#{new_password}"
      ) {
        authToken
      }
    }
    GRAPHQL
    graph_request(query)
  end

  def unbind_account(type, token = false)
    query = <<-GRAPHQL
    mutation unbind_account {
      unbind(
        type: #{type}
      ) {
        success
      }
    }
    GRAPHQL
    graph_request(query, token)
  end

  def bind_account(payload, token = false)
    query = <<-GRAPHQL
    mutation bind_account(
      $auth: AuthInput!,
      $newAccount: NewAccountInput!
    ) {
        bind(
          auth: $auth,
          newAccount: $newAccount
        ) {
          success
        }
      }
    GRAPHQL
    graph_request(query, token, false, payload)
  end

  def verify_email(token)
    query = <<-GRAPHQL
    mutation verify_email {
      verifyEmail(
        token: "#{token}"
      ) {
        success
      }
    }
    GRAPHQL
    graph_request(query)
  end

  def send_verification_email(email, locale = false)
    query = <<-GRAPHQL
    mutation send_verification_email {
      sendVerificationEmail(
        email: "#{email}"
      ) {
        success
      }
    }
    GRAPHQL
    graph_request(query, false, locale)
  end

  def set_password(old_password, new_password, token = false)
    query = <<-GRAPHQL
    mutation set_password {
      setPassword(
        oldPassword: "#{old_password}",
        newPassword: "#{new_password}"
      ) {
        authToken
      }
    }
    GRAPHQL
    graph_request(query, token)
  end

  def cms_login(payload)
    query = <<-GRAPHQL
    mutation cms_login(
      $input: CmsUserLoginInput!
    ) {
        cmsUserLogin(
          input: $input
        ) {
        authToken
        }
      }
    GRAPHQL
    graph_request(query, false, false, payload)
  end

  def landlord_login(payload)
    query = <<-GRAPHQL
    mutation landlord_login(
      $input: LandlordAccountLoginInput!
    ) {
        landlordAccountLogin(
          input: $input
        ) {
        authToken
        }
      }
    GRAPHQL
    graph_request(query, false, false, payload)
  end
end
