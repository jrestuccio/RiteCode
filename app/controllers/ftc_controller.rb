class FtcController < ApplicationController

def index
	@ftcs = Ftc.order(:code)   #the @ftcs must match our table name!
	@icd9s = Icd9.order(:code)
	@icd10s = Icd10.order(:code)
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

  # some things need to change in this function
  # in line 42 the hardcoded "exception: false" should be removed
  def create
  	if params[:icd9][:idc9_id].present?
	  	icd9 = Icd9.find(params[:icd9][:idc9_id])        
	  	@ftc = Ftc.create(code: icd9.code, shortdesc: icd9.shortdesc, longdesc: icd9.longdesc)       
		if @ftc.valid?
	  	    redirect_to ftc_index_path, notice: "Code was added Successfully"
        else
            redirect_to ftc_index_path, notice: "That code is already in your report."
        end
  	else
  		redirect_to ftc_index_path, notice: "No addtional code selected."
  	end

  end

  def clear
	Ftc.delete_all
	redirect_to ftc_index_path
  end

end
