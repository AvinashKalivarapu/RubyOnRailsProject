class AdminController < ApplicationController
  	def index
  		@users = User.all
  		@pics = Pictures.all
  		@count = 1
  	end

  	def serve
		@photo = Pictures.find(params[:id])
		send_data(@photo.data, :type => @photo.mime_type, :filename => "#{@photo.filename}.jpg", :disposition => "inline")
	end

end
