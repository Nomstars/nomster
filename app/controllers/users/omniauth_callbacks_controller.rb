class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def venmo
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, :kind => "Venmo") if is_navigational_format?
    else
      session["devise.venmo_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end
