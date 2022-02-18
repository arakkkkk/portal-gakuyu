class KyokuinController < ApplicationController
before_action :login_kyokuin
# skip_before_action :require_sign_in!

def kyokuin1
	@koukabihin=Equipment.where(category: '高価備品')
        @kodorui=Equipment.where(category: 'コード類')
        @bungu=Equipment.where(category: '文具')
        @souzikougutyouri=Equipment.where(category: '掃除工具調理')
        @supotuyouhin=Equipment.where(category: 'スポーツ用品')
	@hikitugi=Hikitugi.where(state: nil)
	@resolution=Hikitugi.where(state: 'zumi')
	@bunsitu=Equipment.where(category: '分室備品')
        @souritusya=Equipment.where(category: '創立者セット')
	render template: 'kyokuin/kyokuin1'
end
def kyokuin1_new
	render template: 'kyokuin/kyokuin1_new'
end
def kyokuin1_save
	@hikitugi=Hikitugi.new(hikitugi_params)
	if @hikitugi.save
		redirect_to :kyokuin1
	else
		render template: 'home/error'
	end
end
def kyokuin1_edit
	@hikitugi=Hikitugi.find(params[:format]) 
	render template: 'kyokuin/kyokuin1_edit'
end
def hikitugi
	@hikitugi=Hikitugi.find(params[:format])
        if @hikitugi.update(hikitugi_parapara)
                redirect_to :kyokuin1
        else
                rrender template: 'home/error'
        end
end
def kyokuin1_destroy
        @hikitugi=Hikitugi.find(params[:format])
        @hikitugi.destroy
end

def kyokuin2
	@kasidasi=RentalEquip.where(kasidasi: nil).where(kyoka: nil)
	@entai=RentalEquip.where(rental_at: (100.days.ago)..(Time.zone.now)).where(return_at: (100.days.ago)..(Time.zone.now)).where(henkyaku: nil).where.not(kasidasi: nil).where.not(kasidasi: "")
	@kasidasityu=RentalEquip.where.not(kasidasi: nil).where(henkyaku: nil).where.not(kasidasi: "")
	@zyunbi=RentalEquip.where(rental_at: (Time.zone.now)..(1.days.after)).where(kasidasi: nil).where.not(kyoka: nil)
	@yoyaku=RentalEquip.where(rental_at: (Time.zone.now)..(100.days.after))
	@others=RentalEquip.where(henkyaku: nil)
	@time=Time.zone.now
	render template: 'kyokuin/kyokuin2'
end
def kyokuin2_edit
	@rentalequip=RentalEquip.find(params[:format])
	render template: 'kyokuin/kyokuin2_edit'
end
def kyokuin2_update
	@rentalequip=RentalEquip.find(params[:format])
        if @rentalequip.update(rental_equip_parapara)
                redirect_to :kyokuin2
        else
                render template: 'home/error'
        end
end
def kyokuin2_new
        @rentalequip=RentalEquip.find(params[:format])
        if @rentalequip.update(rental_equip_params)
                redirect_to :kyokuin2
        else
                render template: 'home/error'
        end
end
def kyokuin2_henkyaku
	render template: 'kyokuin/kyokuin2_henkyaku'
end
def kyokuin2_kyoka
        @rentalequip=RentalEquip.find(params[:format])
        render template: 'kyokuin/kyokuin2_kyoka'
end
def kyokuin2_kasidasi
	@rentalequip=RentalEquip.find(params[:format])
        render template: 'kyokuin/kyokuin2_kasidasi'
end
def kyokuin2_one
	@rentalequip=RentalEquip.find(params[:format])
	render template: 'kyokuin/kyokuin2_one'
end
def destroy
        @rentalequip=RentalEquip.find(params[:format])
        @rentalequip.destroy
        redirect_to :kyokuin2
end
def kyokuin2_itiran
	@kasidasi=RentalEquip.where(kasidasi: nil).where(kyoka: nil)
        @entai=RentalEquip.where(rental_at: (100.days.ago)..(Time.zone.now)).where(return_at: (100.days.ago)..(Time.zone.now)).where(henkyaku: nil).where.not(kasidasi: nil)
        @kasidasityu=RentalEquip.where.not(kasidasi: nil).where(henkyaku: nil)
        @zyunbi=RentalEquip.where(rental_at: (Time.zone.now)..(1.days.after))
        @yoyaku=RentalEquip.where(rental_at: (Time.zone.now)..(100.days.after))
        @others=RentalEquip.where(henkyaku: nil)
        @time=Time.zone.now
        render template: 'kyokuin/kyokuin2_itiran'
end
def kyokuin2_create
	@rentalequip=RentalEquip.find(params[:id])
        if @rentalequip.update(rental_equip_params)
                redirect_to :kyokuin2
        else
                render template: 'home/error'
        end
end
def kyokuin2_crecre
	redirect_to :kyokuin2
end


def kyokuin3
	@kasidasi=Facility.where(kasidasi: nil).where(kyoka: nil)
        @entai=Facility.where(rental_at: (100.days.ago)..(Time.zone.now)).where(return_at: (100.days.ago)..(Time.zone.now)).where(henkyaku: nil).where.not(kasidasi: nil).where.not(kasidasi: "")
        @kasidasityu=Facility.where(rental_at: (100.days.ago)..(Time.zone.now)).where(return_at: (Time.zone.now)..(1.days.after)).where.not(kasidasi: nil).where(henkyaku: nil).where.not(kasidasi: "")
	@tyuothers=Facility.where(rental_at: (100.days.ago)..(Time.zone.now)).where.not(kasidasi: nil).where(henkyaku: nil).where(return_at: nil)
	@zyunbi=Facility.where(rental_at: (9.hours.ago)..(1.days.after))
        @yoyaku=Facility.where(rental_at: (9.hours.ago)..(100.days.after))
        render template: 'kyokuin/kyokuin3'
end
def kyokuin3_one
        @facility=Facility.find(params[:format])
        render template: 'kyokuin/kyokuin3_one'
end
def kyokuin3_edit
        @rentalequip=Facility.find(params[:format])
        render template: 'kyokuin/kyokuin3_edit'
end
def kyokuin3_update
        @rentalequip=Facility.find(params[:format])
        if @rentalequip.update(facility_parapara)
                redirect_to :kyokuin3
        else
                render template: 'home/error'
        end
end
def kyokuin3_new
        @rentalequip=Facility.find(params[:format])
        if @rentalequip.update(facility_params)
                redirect_to :kyokuin3
        else
                render template: 'kyokuin/kyokuin3_edit'
        end
end
def kyokuin3_henkyaku
        render template: 'kyokuin/kyokuin3_henkyaku'
end
def kyokuin3_kyoka
        @facility=Facility.find(params[:format])
        render template: 'kyokuin/kyokuin3_kyoka'
end     
def kyokuin3_kasidasi
        @rentalequip=Facility.find(params[:format])
        render template: 'kyokuin/kyokuin3_kasidasi'
end
def kyokuin3_create
        @facility=Facility.find(params[:id])
        if @facility.update(facility_params)
                redirect_to :kyokuin3
        else
                render template: 'home/error'
        end
end
def kyokuin3_crecre
        redirect_to :kyokuin3
end


def destroy2
        @facility=Facility.find(params[:format])
        @facility.destroy
        redirect_to :kyokuin3
end

def kyokuin4
	@zyunbi=RentalEquip.where(rental_at: (Time.zone.today.end_of_day)..(1.days.after)).where(henkyaku: nil).where.not(kyoka: nil).where(kasidasi: "")
        @yoyaku=RentalEquip.where(henkyaku: nil).where(kasidasi: [nil,""]).where(rental_at: (1.days.ago)..(100.days.after)).where.not(kyoka: nil).where(kasidasi: "")
	render template: 'kyokuin/kyokuin4'
end
def kyokuin4_itiran
        @yoyaku=RentalEquip.where(henkyaku: nil).where(kasidasi: nil).where.not(kyoka: nil)
        render template: 'kyokuin/kyokuin4_itiran'
end



def kyokuin5
        @yoyaku=Facility.where(henkyaku: nil).where(kasidasi: [nil,""]).where(rental_at: (1.days.ago)..(100.days.after)).where.not(kyoka: nil)
	render template: 'kyokuin/kyokuin5'
end

def kyokuin6
	@equipment=Equipment.all
	@music=Facility.where(return_at: (365.days.ago)..(100.days.after)).where(room: ["音楽練習室A", "音楽練習室B", "音楽練習室C", "音楽練習室D", "音楽練習室E","音楽練習室F", "音楽練習室G"])
	@meeting=Facility.where(return_at: (365.days.ago)..(100.days.after)).where(room: ["会議室１", "会議室２", "会議室３", "厨房", "和室"])
	@others=Facility.where(return_at: (365.days.ago)..(100.days.after)).where(room: ["音楽練習室A", "音楽練習室B", "音楽練習室C", "音楽練習室D", "音楽練習室E","音楽練習室F", "音楽練習室G"])
	@rentalequip=RentalEquip.where(return_at: (365.days.ago)..(100.days.after))
        @rentalequip=RentalEquip.all
	gon.rentalequip=@rentalequip
        gon.count=RentalEquip.count
	@facility=Facility.all
        gon.facility=@facility
        gon.fcount=Facility.count
	render template: 'kyokuin/kyokuin6'
end
def kyokuin_kasidasische
        @equipment=Equipment.all
        @music=Facility.all
        @meeting=Facility.all
        @others=Facility.all
        @rentalequip=RentalEquip.all
        @rentalequip=RentalEquip.all
        gon.rentalequip=@rentalequip
        gon.rcount=RentalEquip.count
        @facility=Facility.all
        gon.facility=@facility
        gon.fcount=Facility.count
        puts gon.fcount
        puts gon.fcount
        puts gon.fcount
        render template: 'kyokuin/kyokuin_kasidasische'
end
def kyokuin_musicsche
        @equipment=Equipment.all
        @music=Facility.all
        @meeting=Facility.all
        @others=Facility.all
        @rentalequip=RentalEquip.all
        @rentalequip=RentalEquip.all
        gon.rentalequip=@rentalequip
        gon.rcount=RentalEquip.count
        @facility=Facility.all
        gon.facility=@facility
        gon.fcount=Facility.count
        puts gon.fcount
        puts gon.fcount
        puts gon.fcount
        render template: 'kyokuin/kyokuin_musicsche'
end
def kyokuin_meetsche
        @equipment=Equipment.all
        @music=Facility.all
        @meeting=Facility.all
        @others=Facility.all
        @rentalequip=RentalEquip.all
        @rentalequip=RentalEquip.all
        gon.rentalequip=@rentalequip
        gon.rcount=RentalEquip.count
        @facility=Facility.all
        gon.facility=@facility
        gon.fcount=Facility.count
        render template: 'kyokuin/kyokuin_meetsche'
end
def kyokuin_othersche
        @equipment=Equipment.all
        @music=Facility.all
        @meeting=Facility.all
        @others=Facility.all
        @rentalequip=RentalEquip.all
        @rentalequip=RentalEquip.all
        gon.rentalequip=@rentalequip
        gon.rcount=RentalEquip.count
        @facility=Facility.all
        gon.facility=@facility
        gon.fcount=Facility.count
        render template: 'kyokuin/kyokuin_othersche'
end
def kyokuin_actsche
        @support=Support.all
        gon.support=@support
        gon.scount=Support.count
        render template: 'kyokuin/kyokuin_actsche'
end

def support
        @support=Support.all
        render template: 'kyokuin/support'
end
def support_one
        @support=Support.find(params[:format])
        render template: 'kyokuin/support_one'
end
def support_edit
        @support=Support.find(params[:format])
        render template: 'kyokuin/support_edit'
end
def support_update
        @support=Support.find(params[:format])
        # if !(@support.status==""||@support.status==nil) then
        #         @support.status = "確認済み"
        # end
        if @support.update(support_params)
                redirect_to :support
        else
                redirect_to :error
        end
end


def login_kyokuin
        @user_id=current_user.id
        @user=Secpass.find(@user_id)
        if  @user.logtype == "member"
                redirect_to none_path
        end
end

def settings
	render template: 'home/settings'
end


def events
	@events=Event.all.where(end: (Time.zone.now)..(300.days.after)).order("start")
	render template: 'home/events'
end
def events_new
        render template: 'home/events_new'
end
def events_create
	@event=Event.new(events_params)
        if @event.save
                redirect_to :events
        else
                redirect_to :events
        end
end
def event_one
	@event=Event.find(params[:format])
	render template: 'home/event_one'
end
def event_edit
	@event=Event.find(params[:format])
        render template: 'home/event_edit'
end
def event_edit_action
	@event=Event.find(params[:format])
	if @event.update(events_parapara)
                redirect_to :events
        else
                render template: 'kyokuin/event'
        end
end
def delevent
	@event=Event.find(params[:format])
	@event.destroy
	redirect_to :events
end


def soudaisai_bihin
	@firstday=Rnum.find(2)
        gon.firstday=@firstday.num
        @daynum=Rnum.find(3)
        gon.daynum=@daynum.num
	@rentalequip=RentalEquip.all
	@equipment=Equipment.all
	gon.rentalequip=@rentalequip.order("rental_at")
	gon.equipment=@equipment
	gon.rcount=RentalEquip.count
	gon.ecount=Equipment.count
	render template: 'kyokuin/soudaisai_bihin'
end
def soudaisai_club
        @firstday=Rnum.find(2)
        gon.firstday=@firstday.num
        @daynum=Rnum.find(3)
        gon.daynum=@daynum.num
        @rentalequip=RentalEquip.all
        @equipment=Equipment.all
        gon.rentalequip=@rentalequip.order("rental_at")
        gon.equipment=@equipment
        gon.rcount=RentalEquip.count
        gon.ecount=Equipment.count
        render template: 'kyokuin/soudaisai_club'
end
def soudaisai_time
        @firstday=Rnum.find(2)
        gon.firstday=@firstday.num
        @daynum=Rnum.find(3)
        gon.daynum=@daynum.num
        @rentalequip=RentalEquip.all
        @equipment=Equipment.all
        gon.rentalequip=@rentalequip.order("name").order("rental_at")
        gon.equipment=@equipment
        gon.rcount=RentalEquip.count
        gon.ecount=Equipment.count
        render template: 'kyokuin/soudaisai_time'
end

def soudaisai_list
        @rentalequip=RentalEquip.order("g_name").order("rental_at")
        render template: 'kyokuin/soudaisai_list'
end




def soudaisai_edit
        @rentalequip=RentalEquip.find(params[:format])
        render template: 'kyokuin/soudaisai_edit'
end
def soudaisai_update
        @rentalequip=RentalEquip.find(params[:format])
        if @rentalequip.update(rental_equip_parapara)
                redirect_to :soudaisai_bihin
        else
                render template: 'kyokuin/soudaisai_edit'
        end
end
def s_destroy
        @rentalequip=RentalEquip.find(params[:format])
        @rentalequip.destroy
        redirect_to :soudaisai_bihin
end
def soudaisai_henkyaku
	@rentalequip=RentalEquip.find(params[:format])
        render template: 'kyokuin/soudaisai_henkyaku'
end
def soudaisai_kasidasi
        @rentalequip=RentalEquip.find(params[:format])
        render template: 'kyokuin/soudaisai_kasidasi'
end


def rental_equip_params
	params.permit(:id, :r_num, :return_at, :henkyaku, :kasidasi, :yoyaku, :kyoka, :place, :katudo_naiyo, :email, :no_text)
end
def rental_equip_parapara
        params.require(:rental_equip).permit(:id, :r_num, :return_at, :henkyaku, :kasidasi, :yoyaku, :kyoka, :g_name, :r_name, :no_text, :place, :katudo_naiyo, :email)
end
def facility_params
        params.permit(:id, :room, :return_at, :henkyaku, :kasidasi, :yoyaku, :kyoka, :katudo_num, :katudo_naiyo, :email)
end
def facility_parapara
        params.require(:facility).permit(:room, :return_at, :henkyaku, :kasidasi, :yoyaku, :kyoka, :katudo_num, :katudo_naiyo, :email)
end
def hikitugi_params
	params.permit(:title, :name, :text, :state)
end
def hikitugi_parapara
	params.require(:hikitugi).permit(:title, :name, :text, :state)
end
def events_params
	params.permit(:title, :description, :start, :end)
end
def events_parapara
        params.require(:event).permit(:title, :description, :start, :end)
end
def support_params
    params.permit(:name, :email, :text, :tell, :g_name, :cate, :time, :status)
    params.require(:support).permit(:name, :email, :text, :tell, :g_name, :cate, :time, :status)
end

end
