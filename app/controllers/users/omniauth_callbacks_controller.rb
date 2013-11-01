class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def google_oauth2
    @user = User.find_or_create(extract_args)
    sign_in(@user) if @user
    redirect_to root_path
  end

  private

  def after_omniauth_failure_path_for(resource)
    root_path
  end

  protected

  def extract_args
    raw = request.env['omniauth.auth']

    {
      uid: raw.uid,
      first_name: raw.info.first_name,
      last_name: raw.info.last_name,
      email: raw.info.email,
      provider: raw.provider,
      image_url: raw.info.image,
      gender: raw.info.gender,
      auth_token: raw.credentials.token
    }
  end

end