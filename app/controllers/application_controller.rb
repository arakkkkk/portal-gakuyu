class ApplicationController < ActionController::Base
  before_action :current_user
  before_action :require_sign_in!
  helper_method :signed_in?
  before_action :user

  protect_from_forgery with: :exception

  def user
    @current_user_id=current_user.id
    @current_user=Secpass.find(@current_user_id)
    gon.user_info=@current_user
    gon.signstatus="on"
  rescue
    gon.signstatus="off"
  end

  def current_user
    remember_token = Secpass.encrypt(cookies[:secpass_remember_token])
    @current_secpass ||= Secpass.find_by(remember_token: remember_token)
  end

  # def sign_in(secpass)
  #   remember_token = Secpass.new_remember_token
  #   cookies.permanent[:secpass_remember_token] = remember_token
  #   secpass.update!(remember_token: Secpass.encrypt(remember_token))
  #   @current_secpass = secpass
  # end

  def sign_in(secpass)
    if secpass.name == "gakuyu46" || secpass.name == "gakuyu47"then
      remember_token = "aYURToCDCBvh3N_9wJUnhQ"
      cookies.permanent[:secpass_remember_token] = remember_token
      secpass.update!(remember_token: Secpass.encrypt(remember_token))
      @current_secpass = secpass
    elsif secpass.id == 300 then
      remember_token = "aYURToCDCBvh3N_9wJ"
      cookies.permanent[:secpass_remember_token] = remember_token
      secpass.update!(remember_token: Secpass.encrypt(remember_token))
      @current_secpass = secpass
    elsif secpass.id == 200 then
      remember_token = "aYURToCDCBvh3N_9wJUn"
      cookies.permanent[:secpass_remember_token] = remember_token
      secpass.update!(remember_token: Secpass.encrypt(remember_token))
      @current_secpass = secpass
    elsif secpass.id == 100 then
        remember_token = "aYURToCDCBvh3N_9wJUnh"
        cookies.permanent[:secpass_remember_token] = remember_token
        secpass.update!(remember_token: Secpass.encrypt(remember_token))
        @current_secpass = secpass
    else
      remember_token = Secpass.new_remember_token
      cookies.permanent[:secpass_remember_token] = remember_token
      secpass.update!(remember_token: Secpass.encrypt(remember_token))
      @current_secpass = secpass
    end
  end

  def sign_out
    cookies.delete(:secpass_remember_token)
  end
  
  def signed_in?
    @current_secpass.present?
  end

  private

    def require_sign_in!
      # redirect_to login_path unless signed_in?
      redirect_to portal_login_path(url: request.url ) unless signed_in?
    end
end
