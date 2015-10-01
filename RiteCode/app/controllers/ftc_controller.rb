class FtcController < ApplicationController

def index
	#@ftcs = Ftc.all

	@ftcs = Ftc.order(:code)   #the @ftcs must match our table name!
	end



def show
	@ftcs = Ftc.order(:code)   #the @ftcs must match our table name!
	respond_to do |format|
		format.html
		format.csv { render text: @ftcs.to_csv , content_type: 'text/plain' }
		#format.csv { send_data @ftcs.to_csv}
		format.xls
		 #format.csv { render text: "Hello, world", content_type: 'text/plain' }
		  #{ send_data @ftcs.to_csv(col_sep: "\t")}
	end
end


end
