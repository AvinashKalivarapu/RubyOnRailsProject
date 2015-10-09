class DashboardController < ApplicationController

	before_filter :authenticate_user!
	def index
		if current_user.email == 'avinash@kali.com'
			redirect_to :controller=>'admin', :action => 'index'
		end
	end
	
end
