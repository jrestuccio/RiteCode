class Icd10Controller < ApplicationController
  def index
	@icd10s = Icd10.order(:code)
  end

def show
	@icd10s = Icd10.order(:code)   #the @ftcs must match our table name!
	respond_to do |format|
		format.html
		format.csv { render text: @icd10s.to_csv , content_type: 'text/plain' }
		#format.csv { send_data @ftcs.to_csv}
		format.xls
		 #format.csv { render text: "Hello, world", content_type: 'text/plain' }
		  #{ send_data @ftcs.to_csv(col_sep: "\t")}
	end
end


def icd10_params
	params.require(:icd10).permit(:code,:exception,:shortdesc,:longdesc)
end


def import
	Icd10.import(params[:file])
	redirect_to icd10_index_path, notice: "Codes were added Successfully"
	#redirect_to import_ftc_index_path, notice: "Codes were added Successfully"
end



end
