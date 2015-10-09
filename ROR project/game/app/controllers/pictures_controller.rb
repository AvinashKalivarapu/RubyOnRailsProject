class PicturesController < ApplicationController
	def new
		@pic = Pictures.new
  	end

	def create
		@pic = Pictures.new(params_data) do |t|
      		if params[:pictures][:data]
       		 	t.data      = params[:pictures][:data].read
        		t.filename  = params[:pictures][:data].original_filename
		        t.mime_type = params[:pictures][:data].content_type
      		end
    	end
    
    # normal save
	    if @pic.save
   		   	redirect_to(dashboard_index_path)
    	else
     		render :action => "new"
    	end		
   	end
   	private
	def params_data
    	params.require(:pictures).permit(:tag)
  	end
end
