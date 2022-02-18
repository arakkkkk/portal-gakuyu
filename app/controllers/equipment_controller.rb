class EquipmentController < ApplicationController
	
#	skip_before_action :require_sign_in!
before_action :login_jimu

#before_action :set_equipment, only: [:edit_equipment]

def jimu
	@koukabihin=Equipment.where(category: '高価備品')
        @kodorui=Equipment.where(category: 'コード類')
        @bungu=Equipment.where(category: '文具')
        @souzikougutyouri=Equipment.where(category: '掃除工具調理')
        @supotuyouhin=Equipment.where(category: 'スポーツ用品')
        @bunsitu=Equipment.where(category: '分室備品')
	@souritusya=Equipment.where(category: '創立者セット')
	render template: 'home/jimu'
end
def jimu2
        render template: 'home/jimu2'
end
def jimu3
	@koukabihin=Equipment.where(category: '高価備品')
        @kodorui=Equipment.where(category: 'コード類')
	@bungu=Equipment.where(category: '文具')
	@souzikougutyouri=Equipment.where(category: '掃除工具調理')
	@supotuyouhin=Equipment.where(category: 'スポーツ用品')
	@nocate=Equipment.where(category: nil)
	@bunsitu=Equipment.where(category: '分室備品')
        @souritusya=Equipment.where(category: '創立者セット')
	render template: 'home/jimu3'

end
def jimu3_edit
	@equipment=Equipment.find(params[:id])
	render template: 'home/jimu3_edit'
end
def jimu4
	@kyoyuhainotis=Kyoyuhainoti.where(state: nil)
	@resolution=Kyoyuhainoti.where(state: 'zumi')
	render template: 'home/jimu4'

end
def jimu4_edit
        @kyoyuhainoti=Kyoyuhainoti.find(params[:format])
        render template: 'home/jimu4_edit'
end
def jimu5
	render template: 'home/jimu5'
end
def jimu6
        @equipments=Equipment.all
	gon.equipment=@equipments
	gon.ecount=Equipment.count
        @rentalequip=RentalEquip.all
        gon.rentalequip=@rentalequip
        gon.rcount=RentalEquip.count
	render template: 'home/jimu6'
end
def jimu6_new
	@equipment=RentalEquip.new(youbou_params)
	@equipment.youbousyo=@equipment.kyoka
	if @equipment.save
                redirect_to :jimu6
        else
                redirect_to :jimu6
        end
end
def create
	@equipment=Equipment.new(equipment_params)
	if @equipment.save
		redirect_to :jimu
	else
		redirect_to :jimu2
	end
end

def edit_equipment
	@equipment=Equipment.find(params[:id])
	if @equipment.update(equipment_parapara)
                redirect_to :jimu3
        else
                render template: 'home/jimu3'
        end
end

def destroy
	@equipment=Equipment.find(params[:id])
	@equipment.destroy
	redirect_to :jimu3
end
def kdestroy
        @kyoyuhainoti=Kyoyuhainoti.find(params[:id])
        @kyoyuhainoti.destroy
        redirect_to :jimu4
end

def share
	@kyoyuhainoti=Kyoyuhainoti.new(kyoyuhainoti_params)
	if @kyoyuhainoti.save
                redirect_to :jimu4
        else
                render template: 'home/jimu5'
        end
end

def edit_kyoyuhainoti
	@kyoyuhainoti=Kyoyuhainoti.find(params[:format])
	if @kyoyuhainoti.update(kyoyuhainoti_parapara)
                redirect_to :jimu4
        else
                render template: 'home/jimu4'
        end
end

def login_jimu
	@user_id=current_user.id
	@user=Secpass.find(@user_id)
	if @user.logtype != "jimu"
		redirect_to none_path 
	end
end
		


private
	def equipment_params
	        params.permit(:name, :number, :max_number, :category, :setumei)
	end     
	def equipment_parapara
	        params.require(:equipment).permit(:name, :number, :max_number, :category, :setumei)
	end
	def kyoyuhainoti_parapara
	        params.require(:kyoyuhainoti).permit(:state)
	end

	def kyoyuhainoti_params
	 	params.permit(:name, :title, :text)
	end

	def set_equipment
		@equipment=Equipment.find(params[:id])
	end
	def youbou_params
		params.permit(:name, :r_num, :rental_at, :return_at, :g_name, :r_name, :tell, :no_text, :kyoka, :youbousyo)
	end
end



