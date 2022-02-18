class PortalController < ApplicationController
    protect_from_forgery
    layout false
    before_action :setinstance
    before_action :login_portal
    before_action :or_editor, only: [:portal2, :club_editnav, :portal_editaccount, :portal_request, :portal_request1]

    def setinstance
        @user_id=current_user.id
        @user=Secpass.find(@user_id)
        @titlec = ""
        @navlist = Portalnav.where(group: "club").where.not(parent: "clubmessage")
        # @navlist = Portalnav.all.order(id: "DESC")
        @portalnav = Portalnav.new
        @parent_array = []
        @navlist.each do |portalnav|
            if portalnav.child == nil && portalnav.parent != nil && portalnav.parent != "clubmessage"  then
                @parent_array.insert(0,portalnav.parent)
            end
        end
        @text = ""
        @parenttext = ""
        @childtext = ""
        @navtext = ""
        @text = @text + '<li><a id="homenav" href="/portal_index">HOME</a></li>'
        for parent in @parent_array do
            if parent != nil && parent != "clubmessage" then
                @navtext = @navtext + '<div class="row"><div class="col-xl-12 col-lg-12"><div class="row"><div class="col-xl-6 col-lg-6">'
                @navtext = @navtext + '<p>' + parent + '&nbsp;&nbsp;'
                @navtext = @navtext + '<button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#portalmodal'+parent+'">消去</button></p>'
                @navtext = @navtext + '<div class="modal fade" id="portalmodal'+parent+'" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">'
                @navtext = @navtext + '<div class="modal-dialog" role="document"><div class="modal-content"><div class="modal-header">'
                @navtext = @navtext + '<h5 class="modal-title" id="exampleModalLabel">'+parent+'の消去</h5>'
                @navtext = @navtext + '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>'
                @navtext = @navtext + '<div class="modal-body">一度消去するともとには戻せません</div>'
                @navtext = @navtext + '<div class="modal-footer"><button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>'
                @navtext = @navtext + '<button type="button" class="btn btn-primary"><a href="/delete_parent.'+parent+'">消去</a></button>'
                @navtext = @navtext + '</div></div></div></div>'
                @navtext = @navtext + '</div><div class="col-xl-6 col-lg-6">'
                @text = @text + '<li>'
                @text = @text + '<a href="#'+parent+'" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">'+parent+'</a>'
                @text = @text + '<ul class="collapse list-unstyled" id="'+parent+'">'
                @navlist.each do |portalnav|
                    if portalnav.child != nil then
                        if portalnav.parent == parent then
                            # サイドバー
                            @text = @text + '<li>'
                            @text = @text + '<a id="'+portalnav.child+'" href="/portal1.'+portalnav.id.to_s+'">'+portalnav.child+'</a>'
                            @text = @text + '</li>'
                            # サイドバーの編集
                            @navtext = @navtext + '<p>'
                            @navtext = @navtext + portalnav.child + '&nbsp;&nbsp;'
                            @navtext = @navtext + '<button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#portalmodal'+portalnav.id.to_s+'">消去</button></p>'
                            @navtext = @navtext + '<div class="modal fade" id="portalmodal'+portalnav.id.to_s+'" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">'
                            @navtext = @navtext + '<div class="modal-dialog" role="document"><div class="modal-content"><div class="modal-header">'
                            @navtext = @navtext + '<h5 class="modal-title" id="exampleModalLabel">'+portalnav.child+'の消去</h5>'
                            @navtext = @navtext + '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>'
                            @navtext = @navtext + '<div class="modal-body">一度消去するともとには戻せません</div>'
                            @navtext = @navtext + '<div class="modal-footer"><button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>'
                            @navtext = @navtext + '<button type="button" class="btn btn-primary py-0"><a href="/delete_portalnav.'+portalnav.id.to_s+'">消去</a></button>'
                            @navtext = @navtext + '</div></div></div></div>'
                        end
                    end
                end
                if @user.logtype == "editor"
                    @text = @text + '<button type="button" class="btn btn-secondary btn-sm my-2"><a  id="paddingnone" href="portal_addchild.'+parent+'">＋</a></button></a></button></p>'
                end
                @text = @text + '</ul></li>'
                @navtext = @navtext + '</div></div></div></div></div><hr>'

            end

        end
        if @user.logtype == "editor"
            @text = @text + '<li><a id="setpage" href="#page_glycanpathway" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">設定</a><ul class="collapse list-unstyled" id="page_glycanpathway"><li><a id="setnavpage" href="/club_editnav">リストの編集</a></li></ul></li>'   
            @text = @text + '<li><a id="setpage" href="#manual" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">操作方法</a><ul class="collapse list-unstyled" id="manual"><li><a href="portal_intro" class="dropdown-toggle">連絡の追加</a></li><li><a href="portal_intro2" class="dropdown-toggle">ページの追加</a></li></ul></li>'
            @text = @text + '<button type="button" class="btn btn-secondary btn-sm my-2"><a href="portal_addparent">＋</a></button></a></button></p>'
        end
        @text = @text + @user.name
        gon.text = @text
        gon.navtext = @navtext
        @navlist = Portalnav.where(group: "club")
    end

    def portal_index
        @navlist = Portalnav.where(group: "club").where(parent: "clubmessage").where("title IS NULL OR title <> ?", "false").order('id DESC').first(5)
        @request = Portalnav.where(group: "club").where(parent: "clubmessage").where(title: "false").order('id DESC') 
        @content = Portalnav.find(100)
        gon.content = @content
        gon.intro = $url
        $url = ''
        render template: 'portal/portal_index'
    end
    def portal_allmessage
        begin
            sw = "%"+params[:search]+"%"
            @navlist = Portalnav.where(group: "club").where(parent: "clubmessage").where('(content LIKE ?) OR (child LIKE ?)', sw,sw).where("title IS NULL OR title <> ?", "false").order('id DESC').page(params[:page]).per(50)
        rescue => e
            @navlist = Portalnav.where(group: "club").where(parent: "clubmessage").where("title IS NULL OR title <> ?", "false").order('id DESC').page(params[:page]).per(50)
        end        
        render template: 'portal/portal_allmessage'
    end
    def portal1
        if params[:format] == "100"
            redirect_to :portal_index
        else
            @content = Portalnav.where(group: "club").find(params[:format])
            gon.content = @content
            gon.intro = $url
            $url = ''
            render template: 'portal/portal1'
        end
    end
    def portal2
        @content = Portalnav.find(params[:format])
        gon.content = @content
        render template: 'portal/portal2'
    end
    def portal3
        @content = Portalnav.new
        render template: 'portal/portal3'
    end

    def portal_request
        @navlist = Portalnav.where(group: "club").where(parent: "clubmessage").order('id DESC').first(100)
        render template: 'portal/portal_request'
    end

    def portal_request2
        @content = Portalnav.find(params[:format])
        @content.title = nil
        @content.update(portalparams)
        redirect_to :portal_index
    end


    def club_editnav
        render template: 'portal/club_editnav'
    end

    def club_addnavparent
        @portalnav = Portalnav.new(portalnav_params)
        if @portalnav.save
            redirect_to :club_editnav
        else
            # render 'club_editnav'
        end
    end
    def club_addnavchild
        @portalnav = Portalnav.new(portalnav_params)
        if @portalnav.parent == "clubmessage"
            @portalnav.title = "false"
        end
        if @portalnav.save
            redirect_to portal2_path(@portalnav.id)
        else
            # render 'club_editnav'
        end
    end
    def club_addnavchild2
        @portalnav = Portalnav.new(portalnav_params)
        if @portalnav.save
            redirect_to :club_editnav
        else
            # render 'club_editnav'
        end
    end
    def club_editcontent
        @content = Portalnav.find(params[:id])
        @content.update(portalparams)
        # redirect_to portal1_path(params[:id])
    end
    def portal_editaccount
        @portaluser = Secpass.find(100)
        render template: 'portal/portal_editaccount'
    end
    def portal_updateaccount
        @portaluser = Secpass.find(100)
        @portaluser.logtype = "portal"
        @portaluser.update(secpass_params)
        redirect_to :portal_index
    end
    def delete_portalnav
        @content = Portalnav.find(params[:format])
        @content.delete
        redirect_to :club_editnav
    end
    def delete_parent
        @content = Portalnav.where(parent: params[:format])
        for @element in @content do
            @element.delete
        end
        redirect_to :club_editnav
    end


    def login_portal
        gon.nowlogin = $nowlogin 
        $nowlogin = ''
        @user_id=current_user.id
        @user=Secpass.find(@user_id)
        if  @user.logtype != "portal" && @user.logtype != "kyokuin" && @user.logtype != "editor" then
            redirect_to portal_login_path
        end
    end
    def or_editor
        @user_id=current_user.id
        @user=Secpass.find(@user_id)
        if  @user.logtype != "editor" then
            redirect_to portal_index_path
        end
    end

    def portalnav_params
        params.require(:portalnav).permit(:title, :parent, :group, :child, :content, :check)
    end
    def portalparams
        params.permit(:id, :title, :parent, :group, :child, :content, :check)
    end
    def secpass_params
        params.require(:secpass).permit(:name, :password, :logtype)
    end

end
