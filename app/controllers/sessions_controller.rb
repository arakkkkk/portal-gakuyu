class SessionsController < ApplicationController
  skip_before_action :require_sign_in!, only: [:new, :create, :index, :portal_login, :portal_create]
  before_action :set_user, only: [:create]
  
  def none
        render template: 'home/none'
  end
  def index
         @events=Event.all.where(end: (Time.zone.now)..(300.days.after)).order(:start)
        #  redirect_to :gakuyu_info1
        render template: 'home/home'
  end

  def new
     render template: 'home/login'
  end

  def create
    if @session.authenticate(params[:password])
      sign_in(@session)
      if $url == nil
          $url = ''
      end
      $nowlogin = "yes"
      if $url.match(/k?portal1\.\d+/) != nil
        if $url.match('kportal') == nil
          paramnum = $url.scan(/portal1\.\d+/)[0].slice!(8..)
          redirect_to portal1_path(paramnum)
        else
          paramnum = $url.scan(/portal1\.\d+/)[0].slice!(8..)
          redirect_to kportal1_path(paramnum) 
        end
      else
        if $url.match(/notetodo\.\d+/) != nil
          paramnum = $url.scan(/notetodo\.\d+/)[0].slice!(9..)
          redirect_to notetodo_path(paramnum)
        elsif $url.match(/notenote\.\d+/) != nil
          paramnum = $url.scan(/notenote\.\d+/)[0].slice!(9..)
          redirect_to notenote_path(paramnum)
        elsif $url.match(/kportal/) != nil
          redirect_to :kportal_index 
        else
          redirect_to :portal_index
        end
      end
      # redirect_to :portal_index
      #  redirect_to :gakuyu_info1
      #  redirect_to :home
    else
      flash.now[:danger] = t('.flash.invalid_password')
      redirect_to portal_login_path
      # render template: 'home/login'
    end
  end

  def destroy
    sign_out
    redirect_to login_path
  end






  def portal_login
    $url = params[:url]
    render template: 'portal/portal_login'
  end
  def portal_create
    if @session.authenticate(params[:password])
       sign_in(@session)
       redirect_to :portal_index
    else
      flash.now[:danger] = t('.flash.invalid_password')
      redirect_to :portal_login
    end
  end






  private

    def set_user
      @session = Secpass.find_by!(name: session_params[:name])
    rescue
      # render template: 'home/login'
      redirect_to portal_login_path(url: request.url)
    end

    # 許可するパラメータ
    def session_params
      params.permit(:name, :password) 
    end  
end
