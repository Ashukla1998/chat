class UserMailer < ApplicationMailer
    default from: 'shuklaashu134@gmail.com'
  
    def forgot_password_email(user)
      @user = user
      @url = edit_user_password_url(@user, reset_password_token: @user.reset_password_token)
      mail(to: @user.email, subject: 'Reset your password')
    end
  end