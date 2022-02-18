class KportalController < ApplicationController
    layout false
    before_action :ksetinstance
    before_action :klogin_portal
    before_action :kor_editor, only: [:kportal2, :kclub_editnav, :kportal_editaccount, :kportal_request, :kportal_request1]

    def ksetinstance
        @titlec = "局員用"
        @user_id=current_user.id
        @user=Secpass.find(@user_id)
        @navlist = Portalnav.where(group: "kyokuin").where.not(parent: "kyokuinmessage")
        # @navlist = Portalnav.all.order(id: "DESC")
        @portalnav = Portalnav.new
        @parent_array = []
        @navlist.each do |portalnav|
            if portalnav.child == nil && portalnav.parent != nil && portalnav.parent != "kyokuinmessage"  then
                @parent_array.insert(0,portalnav.parent)
            end
        end
        @text = ""
        @parenttext = ""
        @childtext = ""
        @navtext = ""
        @text = @text + '<li><a id="homenav" href="/kportal_index">HOME</a></li>'
        for parent in @parent_array do
        if parent != nil && parent != "kyokuinmessage" then
            @navtext = @navtext + '<div class="row"><div class="col-xl-12 col-lg-12"><div class="row"><div class="col-xl-6 col-lg-6">'
            @navtext = @navtext + '<p>' + parent + '&nbsp;&nbsp;'
            @navtext = @navtext + '<button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#portalmodal'+parent+'">消去</button></p>'
            @navtext = @navtext + '<div class="modal fade" id="portalmodal'+parent+'" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">'
            @navtext = @navtext + '<div class="modal-dialog" role="document"><div class="modal-content"><div class="modal-header">'
            @navtext = @navtext + '<h5 class="modal-title" id="exampleModalLabel">'+parent+'の消去</h5>'
            @navtext = @navtext + '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>'
            @navtext = @navtext + '<div class="modal-body">一度消去するともとには戻せません</div>'
            @navtext = @navtext + '<div class="modal-footer"><button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>'
            @navtext = @navtext + '<button type="button" class="btn btn-primary"><a href="/kdelete_parent.'+parent+'">消去</a></button>'
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
                        @text = @text + '<a id="'+portalnav.child+'" href="/kportal1.'+portalnav.id.to_s+'">'+portalnav.child+'</a>'
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
                        @navtext = @navtext + '<button type="button" class="btn btn-primary"><a href="/kdelete_portalnav.'+portalnav.id.to_s+'">消去</a></button>'
                        @navtext = @navtext + '</div></div></div></div>'
                    end
                end
            end
            if @user.logtype == "editor"
                @text = @text + '<button type="button" class="btn btn-secondary btn-sm my-2"><a  id="paddingnone" href="kportal_addchild.'+parent+'">＋</a></button></a></button></p>'
            end
            @text = @text + '</ul></li>'
            @navtext = @navtext + '</div></div></div></div></div><hr>'

            @navlist = Portalnav.where(group: "kyokuin")
        end
        end
        if @user.logtype == "editor"
            @text = @text + '<li><a href="#page_glycanpathway" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">設定</a><ul class="collapse list-unstyled" id="page_glycanpathway"><li><a id="setnavpage" href="/kclub_editnav">リストの編集</a></li><li><a id="setaccountpage" href="/kportal_account">アカウントの編集</a></li></ul></li>'   
            @text = @text + '<li><a id="setpage" href="#manual" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">操作方法</a><ul class="collapse list-unstyled" id="manual"><li><a href="kportal_intro" class="dropdown-toggle">連絡の追加</a></li><li><a href="kportal_intro2" class="dropdown-toggle">ページの追加</a></li></ul></li>'
            @text = @text + '<button type="button" class="btn btn-secondary btn-sm my-2"><a href="kportal_addparent">＋</a></button></a></button></p>'
        end
        @text = @text + @user.name
        gon.text = @text
        gon.navtext = @navtext
    end

    def kportal_index
        @navlist = Portalnav.where(group: "kyokuin").where(parent: "kyokuinmessage").where("title IS NULL OR title <> ?", "false").order('id DESC').first(5)
        @request = Portalnav.where(group: "kyokuin").where(parent: "kyokuinmessage").where(title: "false").order('id DESC') 
        @content = Portalnav.find(200)
        gon.content = @content
        gon.intro = $url
        $url = ''
        render template: 'kportal/kportal_index'
    end
    def kportal_allmessage
        begin
            sw = "%"+params[:search]+"%"
            @navlist = Portalnav.where(group: "kyokuin").where(parent: "kyokuinmessage").where('(content LIKE ?) OR (child LIKE ?)', sw,sw).where("title IS NULL OR title <> ?", "false").order('id DESC').page(params[:page]).per(50)
        rescue => e
            @navlist = Portalnav.where(group: "kyokuin").where(parent: "kyokuinmessage").where("title IS NULL OR title <> ?", "false").order('id DESC').page(params[:page]).per(50)
        end        
        render template: 'kportal/kportal_allmessage'
    end
    def kportal1
        if params[:format] == "200"
            redirect_to :kportal_index
        else
            @content = Portalnav.where(group: "kyokuin").find(params[:format])
            gon.content = @content
            gon.intro = $url
            $url = ''
            render template: 'kportal/kportal1'
        end
    end
    def kportal2
        @content = Portalnav.find(params[:format])
        gon.content = @content
        render template: 'kportal/kportal2'
    end
    def kportal3
        @content = Portalnav.new
        render template: 'kportal/kportal3'
    end

    def portal_request
        @navlist = Portalnav.where(group: "kyokuin").where(parent: "kyokuinmessage").order('id DESC').first(100)
        render template: 'kportal/kportal_request'
    end
    def kportal_request2
        @content = Portalnav.find(params[:format])
        @content.title = nil
        @content.update(kportalparams)
        redirect_to :kportal_index
    end

    def kclub_editnav
        render template: 'kportal/kclub_editnav'
    end

    def kclub_addnavparent
        @portalnav = Portalnav.new(kportalnav_params)
        if @portalnav.save
            redirect_to :kclub_editnav
        else
            # render 'club_editnav'
        end
    end

    def kclub_addnavchild
        @portalnav = Portalnav.new(kportalnav_params)
        if @portalnav.parent == "kyokuinmessage"
            @portalnav.title = "false"
        end
        if @portalnav.save
            redirect_to kportal2_path(@portalnav.id)
        else
            # render 'kclub_editnav'
        end
    end
    def kclub_addnavchild2
        @portalnav = Portalnav.new(kportalnav_params)
        if @portalnav.save
            redirect_to :kclub_editnav
        else
            # render 'kclub_editnav'
        end
    end
    def kclub_editcontent
        @content = Portalnav.find(params[:id])
        @content.update(kportalparams)
        redirect_to kportal1_path(params[:id])
    end
    def kportal_account
        render template: 'kportal/kportal_account'
    end
    def kportal_editaccount
        @portaluser = Secpass.find(params[:format])
        render template: 'kportal/kportal_editaccount'
    end
    def kportal_updateaccount
        @portaluser = Secpass.find(params[:id].gsub!("value ",""))
        # @portaluser.logtype = "portal"
        @portaluser.update(ksecpass_params)
        redirect_to :kportal_index
    end
    def kdelete_portalnav
        @content = Portalnav.find(params[:format])
        @content.delete
        redirect_to :kclub_editnav
    end
    def kdelete_parent
        @content = Portalnav.where(parent: params[:format])
        for @element in @content do
            @element.delete
        end
        redirect_to :kclub_editnav
    end



    def kportal_note
        @notegroup = Portalnotegroup.all
        gon.notegroup = @notegroup
        render template: 'kportal/kportal_note'
        
    end

    def kportal_addnotetwo
        @notegroup = Portalnotegroup.new
        render template: 'kportal/kportal_addnotetwo'
        
    end
    def addnotetwo
        @notegroup = Portalnotegroup.new(portalnote_params)
        if @notegroup.save
            redirect_to :kportal_note
        else
            # render 'kclub_editnav'
        end
    end
    def kportal_addnotethree
        @notegroup = Portalnotegroup.new
        render template: 'kportal/kportal_addnotethree'
        
    end
    def addnotethree
        @notegroup = Portalnotegroup.new(portalnote_params)
        if @notegroup.save
            redirect_to :kportal_note
        else
            # render 'kclub_editnav'
        end
    end
    def notetodo
        @notelist = Notelist.where(parent: params[:format]).where(dataset: "todo").order('id DESC').first(100)
        begin 
            @notegroup = Portalnotegroup.find(@notelist[0].parent)
        rescue => e
            @notegroup = ""
        end
        render template: 'kportal/notetodo' 
    end
    def toggletodo
        @content = Notelist.find(params[:id])
        parent = @content.parent
        if @content.state == "done" 
            @content.state = "yet"
        else
            @content.state = "done"
        end
        @content.update(notelist_parapara)
        redirect_to notetodo_path(parent)
    end
    def notecontent
        @content = Notelist.find(params[:format])
        gon.content = @content
        render template: "kportal/notecontent"
    end
    def addnote
        @newnote = Notelist.new(notelist_parapara)
        parent = params[:parent]
        if @newnote.save
            if params[:dataset] == "todo"
                redirect_to notetodo_path(parent)
            elsif params[:dataset] == "note"
                redirect_to notenote_path(parent)
            end
        end
    end

    def notecontent2 
        @content = Notelist.find(params[:format])
        render template: "kportal/notecontent2"
    end
    def editnote
        @content = Notelist.find(params[:id])
        @content.update(notelist_params)
        redirect_to notecontent_path(params[:id])
    end
    def notenote
        begin
            sw = "%"+params[:search]+"%"
            @notelist = Notelist.where(parent: params[:format]).where(dataset: "note").where('(content LIKE ?) OR (title LIKE ?)', sw,sw).order('id DESC').page(params[:page]).per(50)
        rescue => e
            @notelist = Notelist.where(parent: params[:format]).where(dataset: "note").order('id DESC').page(params[:page]).per(30) 
        end
        if @notelist.size == 0
            @notelist = Notelist.where(parent: params[:format]).where(dataset: "note").order('id DESC').first(0) 
        end
        begin 
            @notegroup = Portalnotegroup.find(@notelist[0].parent)
        rescue => e
            @notegroup = ""
        end
        render template: 'kportal/notenote' 
    end
    def notenote2
        @content = Notelist.new
        render template: 'kportal/notenote2'
    end 
    def delete_notelist
        @content = Notelist.find(params[:format])
        dataset = @content.dataset
        parent = @content.parent
        @content.delete
        if dataset == "todo"
            redirect_to notetodo_path(parent)
        elsif dataset == "note"
            redirect_to notenote_path(parent)
        end
    end

    def klogin_portal
        gon.nowlogin = $nowlogin 
        $nowlogin = ''
        @user_id=current_user.id
        @user=Secpass.find(@user_id)
        if  @user.logtype != "editor" && @user.logtype != "kyokuin" then
            redirect_to kportal_login_path
        end
    end
    def kor_editor
        @user_id=current_user.id
        @user=Secpass.find(@user_id)
        if  @user.logtype != "editor" then
            redirect_to kportal_index_path
        end
    end
    def kportalnav_params
        params.require(:portalnav).permit(:title, :parent, :group, :child, :content, :check)
    end
    def kportalparams
        params.permit(:id, :title, :parent, :group, :child, :content, :check)
    end
    def ksecpass_params
        params.require(:secpass).permit(:name, :password, :logtype)
    end
    def portalnote_params
        params.require(:portalnotegroup).permit(:groupone, :grouptwo, :groupthree)
    end
    def notelist_params
        params.require(:notelist).permit(:parent, :title, :content, :state, :dataset) 
    end
    def notelist_parapara
        params.permit(:parent, :title, :content, :state, :dataset) 
    end


end
