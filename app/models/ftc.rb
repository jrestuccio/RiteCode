class Ftc < ActiveRecord::Base


def self.import(file)
	spreadsheet = Roo::Spreadsheet.open(file)

	spreadsheet.each(code: 'code', exception: 'exception', shortdesc: "shortdesc", longdesc: "longdesc") do |hash|
		if hash[:code] == "code"
			#puts hash.inspect
		else
			Ftc.create!( code: hash[:code], exception: hash[:exception].to_i.to_b, shortdesc: hash[:shortdesc], longdesc: hash[:longdesc] )		
		end
	end	
end
	
	




def self.to_csv(options = {})
	CSV.generate(options) do |csv|
		csv << column_names
		all.each do |ftc|
			csv << ftc.attributes.values
			#csv << product.attributes.values_at(*column_names)
		end
	end
end
end
