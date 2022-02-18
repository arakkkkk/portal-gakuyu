class UketukeController < ApplicationController
# skip_before_action :require_sign_in!
# before_action :login_uketuke

def uketuke1
        @koukabihin=Equipment.where(category: '高価備品')
        @kodorui=Equipment.where(category: 'コード類')
        @bungu=Equipment.where(category: '文具')
        @souzikougutyouri=Equipment.where(category: '掃除工具調理')
        @supotuyouhin=Equipment.where(category: 'スポーツ用品')
        @bunsitu=Equipment.where(category: '分室備品')
        @souritusya=Equipment.where(category: '創立者セット')
	render template: 'uketuke/uketuke1'
end
def uketuke1_new
	@allequip=Equipment.all
	gon.allequip=@allequip
	gon.equipcount=Equipment.count
	@equipment=Equipment.find(params[:format])
	gon.equipment=@equipment
	@rentalequip=RentalEquip.all
	gon.rentalequip=@rentalequip
	gon.rcount=RentalEquip.count
	render tempalte: 'uketuke/uketuke1_new'
end
def uketuke_soudaisai_new
        @allequip=Equipment.all
        gon.allequip=@allequip
        gon.equipcount=Equipment.count
        gon.equipment=@equipment
        @rentalequip=RentalEquip.all
        gon.rentalequip=@rentalequip
        gon.rcount=RentalEquip.count
        render tempalte: 'uketuke/uketuke_soudaisai_new'
end
def uketuke1_create
	redirect_to :uketuke1
end
def uketuke1_rentalinfo
	@equipment=Equipment.find_by(name: params[:name])
	@n=0
	@equips=params[:equipment_ids]
	@rnum_ids=params[:rnum_ids]
	for @equip in @equips
		@rentalequip=RentalEquip.new(rental_equip_params)
		@rentalequip.name=@equip
		@rentalequip.r_num=@rnum_ids[@n]
		@n+=1
		@rentalequip.save!
	end
	if @rentalequip.save
                redirect_to :uketuke1
        else
                render template: 'home/error'
        end
end


def uketuke2
	@facility=Facility.all
	gon.facility=@facility
        gon.count=Facility.count
	 render template: 'uketuke/uketuke2'
end
def uketuke2_new
	@facility=Facility.all
	gon.facility=@facility
	gon.count=Facility.count
	render template: 'uketuke/uketuke2_new'
end
def uketuke2_back
	redirect_to :uketuke2_new
end
def uketuke2_create
	@facility=Facility.new(facility_params)
	if @facility.save
                redirect_to :uketuke2_new
        else
                render template: 'home/error'
        end
end


def uketuke3
	 render template: 'uketuke/uketuke3'
end
def uketuke3_new 
	@facility=Facility.all
        gon.facility=@facility
        gon.count=Facility.count
        render template: 'uketuke/uketuke3_new'
end
def uketuke3_back
	redirect_to :uketuke3_new
end
def uketuke3_create
        @facility=Facility.new(facility_params)
	if @facility.save
                redirect_to :uketuke3_new
        else
                render template: 'home/error'
        end
end


def uketuke4
	 render template: 'uketuke/uketuke4'
end
def uketuke4_new 
        render template: 'uketuke/uketuke4_new'
end
def uketuke4_create
        @facility=Facility.new(facility_params)
	@facility.rental_at=Time.current
	if @facility.save
                redirect_to :uketuke4
        else
                render template: 'home/error'
        end
end

def uketuke5
	@firstday=Rnum.find(2)
	gon.firstday=@firstday.num
	@daynum=Rnum.find(3)
	gon.daynum=@daynum.num
        @equipments=Equipment.all
        gon.equipment=@equipments
        gon.ecount=Equipment.count
        @rentalequip=RentalEquip.order("rental_at")
        gon.rentalequip=@rentalequip.order("rental_at")
        gon.rcount=RentalEquip.count
        render template: 'uketuke/uketuke5'
end
def uketuke5_new
	redirect_to :uketuke5
end
def uketuke5_create
        @equipment=RentalEquip.new(rental_equip_params)
        #@equipment.youbousyo=@equipment.kyoka
        if @equipment.save
                redirect_to :uketuke5
        else
                render template: 'home/error'
        end
end

def import
  RentalEquip.import(params[:file])
  redirect_to :uketuke5
end

def uketuke_new
    render template: 'uketuke/uketuke_new'
end
def uketuke_create
    @user=Secpass.new(create_params)
    @user.logtype="member"
    if @user.save
                redirect_to :login
        else
                render template: 'home/error'
        end
end



def support_new
    @support=Support.new
    render template: 'uketuke/support_new'
end
def support_create
    @support=Support.new(support_params)
    @support.status="許可待ち"
    if gon.signstatus=="on" then
        @support.name=@current_user.macname
        @support.email=@current_user.name
        @support.tell=@current_user.tell
    end
    if @support.save
                redirect_to :support_new
        else
                render template: 'home/error'
    end
end

def user_kasidasi
    @facility=Facility.where(r_name: @current_user.macname).where(email: @current_user.name).where(tell: @current_user.tell).where(henkyaku: nil).where(kyoka: nil).where(return_at: (100.days.ago)..(1.days.ago))
    @rentalequip=RentalEquip.where(r_name: @current_user.macname).where(email: @current_user.name).where(tell: @current_user.tell).where(henkyaku: nil).where(kyoka: nil).where(return_at: (100.days.ago)..(1.days.ago))
    @support=Support.where(name: @current_user.macname).where(email: @current_user.name).where(tell: @current_user.tell).where.not(time: nil)

    @okfacility=Facility.where(r_name: @current_user.macname).where(email: @current_user.name).where(tell: @current_user.tell).where(henkyaku: nil).where(return_at: (100.days.ago)..(1.days.ago))
    @okrentalequip=RentalEquip.where(r_name: @current_user.macname).where(email: @current_user.name).where(tell: @current_user.tell).where(henkyaku: nil).where(return_at: (100.days.ago)..(1.days.ago))
    render template: 'uketuke/user_kasidasi'
end

def howto_user
    render template: 'uketuke/howto_user'
end







def login_uketuke
        @user_id=current_user.id
        @user=Secpass.find(@user_id)
        if  @user.logtype == "club"
                redirect_to none_path
        end
end


def rental_equip_params
	params.permit(:name, :r_num, :rental_at, :return_at, :g_name, :r_name, :tell, :no_text, :kyoka, :henkyaku, :kasidasi, :place, :katudo_naiyo, :email)
end
def facility_params
	params.permit(:room, :rental_at, :return_at, :g_name, :r_name, :tell, :katudo_num, :katudo_naiyo, :email)
end
def as_params
	params.permit(:equipment_ids, :num, :equipment_id)
end
def create_params
    params.permit(:name, :password, :logtype, :tell, :macname)
end
def support_params
    params.permit(:name, :email, :text, :tell, :g_name, :cate, :time)
    params.require(:support).permit(:name, :email, :text, :tell, :g_name, :cate, :time)
end

end
