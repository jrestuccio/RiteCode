class Ftc < ActiveRecord::Base


def self.import(file)
	spreadsheet = Roo::Spreadsheet.open(file)

	ActiveRecord::Base.transaction do
		spreadsheet.each(code: 'code', shortdesc: "shortdesc", longdesc: "longdesc") do |hash|
			if hash[:code] == "code"
				#puts hash.inspect
			else
				Ftc.create!( code: hash[:code],  shortdesc: hash[:shortdesc], longdesc: hash[:longdesc] )		
			end
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
