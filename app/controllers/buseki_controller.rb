class BusekiController < ApplicationController

def buseki
	render template: 'buseki/buseki'
end

def buseki1
	render template: 'buseki/buseki1'
end
def buseki1_create
	@user=Secpass.new(club_params)
        @club=Club.new(group_params)
	@club.name=@user.name

	if @user.save and @club.save
                redirect_to :buseki
        else
                render template: 'buseki/buseki2'
        end
end

def buseki2
	@club=Club.all
	render template: 'buseki/buseki2'
end



def club_params
        params.permit(:name, :password, :logtype)
end
def group_params
        params.permit(:name, :group, :text)
end

end
