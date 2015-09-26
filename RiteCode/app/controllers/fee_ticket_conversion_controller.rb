class FeeTicketConversionController < ApplicationController

  def index
  	@myCodes = Ftc.order(:code)
  	#renders fee_ticket_conversion/index.html.erb

  	respond_to do |format|
  		format.html
  		#format.csv { render_data :text @myCodes.to_csv , content_type: 'text/plain'}  #If you want to just render the text without downloading.
  		format.csv { send_data @myCodes.to_csv}
  		format.xlsx #{ send_data @myCodes.to_csv(col_sep: "\t")} #newer excel format
  		format.xls { send_data @myCodes.to_csv(col_sep: "\t")}
  	end
  end


  def import
  	Ftc.import(params[:file])
  	redirect_to ftchome_path, notice: "Codes Imported."
  end


end
