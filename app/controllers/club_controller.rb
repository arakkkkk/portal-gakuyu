class ClubController < ApplicationController
before_action :login_club


def club1
	@year1 = Date.current.strftime('%Y')
        @month2 = Date.current.strftime('%m')
	render template: 'club/club1'
end
def club1_create
	@user_id=current_user.id
        @user=Secpass.find(@user_id)
	@club=Club.find_by(name: @user.name)
	@gekkatu=Gekkatu.new(gekkatu_params)
	@gekkatu.name=@club.group
	if @gekkatu.save
                redirect_to :club1
        else
                render template: 'club/club1'
        end	
end

def club2
	@user_id=current_user.id
        @user=Secpass.find(@user_id)
        @club=Club.find_by(name: @user.name)
	@gekkatu=Gekkatu.where(name: @club.group)
	gon.gekkatu = @gekkatu
	gon.count = Gekkatu.count
end
def club2_download
	@user_id=current_user.id
        @user=Secpass.find(@user_id)
        @club=Club.find_by(name: @user.name)
        @gekkatu=Gekkatu.find_by(id: 3)
        data = @gekkatu.avatar.download
        send_data(data, type: 'image/jpeg', filename: 'download.jpg')
end


def login_club
        @user_id=current_user.id
        @user=Secpass.find(@user_id)
	if  @user.logtype == "buseki"
		redirect_to buseki_path
        elsif @user.logtype != "club"
                redirect_to none_path
        end
end
def gekkatu_params
	params.permit(:name, :file, :file_name, :year, :month, :avatar)
end
	

end
