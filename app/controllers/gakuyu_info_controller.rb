class GakuyuInfoController < ApplicationController
  before_action :login_kyokuin

  def gakuyu_info1
    @info = Infomation.where(account: "kyokuin").where(classifi: "whole")
    gon.info = @info
    render template: 'gakuyu_info/gakuyu_info1'
  end

  def gakuyu_info1_create
    @infomation=Infomation.new(infomation_params)
    if @infomation.save
            redirect_to :gakuyu_info1
    else
            render template: 'home/error'
    end
  end

  def gakuyu_info1_new
    gon.account = "kyokuin"
    gon.type = "whole"
    render template: 'gakuyu_info/gakuyu_info1_new'
  end

  def gakuyu_info2
    @info = Infomation.where(account: "kyokuin").where(classifi: "taiiku")
    gon.info = @info
    render template: 'gakuyu_info/gakuyu_info2'
  end 
  
  def gakuyu_info2_new
    gon.account = "kyokuin"
    gon.type = "taiiku"
    render template: 'gakuyu_info/gakuyu_info1_new'
  end


  def gakuyu_info3
    @info = Infomation.where(account: "kyokuin").where(classifi: "gakuzyutu")
    gon.info = @info
    render template: 'gakuyu_info/gakuyu_info3'
  end 
    
  def gakuyu_info3_new
    gon.account = "kyokuin"
    gon.type = "gakuzyutu"
    render template: 'gakuyu_info/gakuyu_info1_new'
  end

  def gakuyu_info4
    @info = Infomation.where(account: "kyokuin").where(classifi: "bungei")
    gon.info = @info
    render template: 'gakuyu_info/gakuyu_info4'
  end 
    
  def gakuyu_info4_new
    gon.account = "kyokuin"
    gon.type = "bungei"
    render template: 'gakuyu_info/gakuyu_info1_new'
  end







  def gakuyu_info1_content
    @info = Infomation.find(params[:format])
    gon.info = @info
    render template: 'gakuyu_info/gakuyu_info1_content'
  end

  def gakuyu_info_s
    @info = Infomation.where(account: "kyokuin")
    gon.info = @info
    render template: 'gakuyu_info/gakuyu_info_s'
  end

  def gakuyu_info_edit
    @info = Infomation.find(params[:format])
    gon.info = @info
    render template: 'gakuyu_info/gakuyu_info_edit'
  end

  def gakuyu_info_update
    @info = Infomation.find(params[:format])
    @info.update(infomation_params)
    redirect_to :gakuyu_info_s
  end


  def gakuyu_info_checked
    @info = Infomation.find(params[:format])
    if @info.done == nil
      @info.done = @current_user.macname
    else
      @info.done = @info.done+','+@current_user.macname
    end
    @info.save
    redirect_to :gakuyu_info1
  end

  def gakuyu_info_new
    render template: 'gakuyu_info/gakuyu_info_new'
  end
  def gakuyu_info_create
      @nuser=Secpass.new(create_params)
      @nuser.logtype="kyokuin"
      if @nuser.save
          redirect_to :login
      else
          render template: 'home/error'
      end
  end

  def gakuyu_info_destroy
    @info = Infomation.find(params[:format])
    @info.destroy
    redirect_to :gakuyu_info1
  end




  def login_kyokuin
    @user_id=current_user.id
    @user=Secpass.find(@user_id)
    if  @user.logtype == "member"
            redirect_to none_path
    end
  end

  def infomation_params
    params.permit(:account, :title, :text, :henkyaku, :type, :date, :badgelist, :done, :pin, :content, :classifi)
  end
  # def infomation_params
    # params.require(:infomation).permit(:account, :title, :text, :henkyaku, :type, :date, :badgelist, :done, :pin, :content, :classifi)
  # end

  def create_params
    params.permit(:name, :password, :logtype, :tell, :macname)
  end
end







