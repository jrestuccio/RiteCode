class FtcController < ApplicationController

def index
	@ftcs = Ftc.order(:code)   #the @ftcs must match our table name!
	@icd10s = Icd10.order(:code)
	@icd9s = Icd9.order(:code)
	
end


def ftc_params
	params.require(:ftc).permit(:code,:exception,:shortdesc,:longdesc)
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


def import
	Ftc.import(params[:file])
	redirect_to ftc_index_path, notice: "Codes were added Successfully"
	#redirect_to import_ftc_index_path, notice: "Codes were added Successfully"
end

end
