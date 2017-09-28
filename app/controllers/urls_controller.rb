class UrlsController < ActionController::Base

	def index 
		@url = Url.all
	end 

	def new 
		@url = Url.new
	end 

	def create 
		# byebug 
		url = Url.new
		short = url.shorten
		url[:long_url] = params[:url][:long_url]
		if url.save 
			flash[:notice] = "your long url has been saved"
			redirect_to urls_path
		else 
			@errors = url.errors.messages
			@url = Url.new
			render :new
		end 
	end 

	def short 
		finding = Url.find(params[:id])
		long = finding.long_url
		redirect_to long 
	end 
end 
