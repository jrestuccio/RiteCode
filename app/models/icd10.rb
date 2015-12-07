class Icd10 < ActiveRecord::Base


def self.import(file)

	spreadsheet = Roo::Spreadsheet.open(file)
	ActiveRecord::Base.transaction do
		spreadsheet.each(code: 'code', exception: 'exception', shortdesc: "shortdesc", longdesc: "longdesc") do |hash|
			if hash[:code] == "code"
				#puts hash.inspect
			else
				Icd10.create!( code: hash[:code], exception: hash[:exception].to_i.to_b, shortdesc: hash[:shortdesc], longdesc: hash[:longdesc] )		
			end
		end	
	end
end
	
	


def self.to_csv(options = {})
	CSV.generate(options) do |csv|
		csv << column_names
		all.each do |icd10|
			csv << icd10.attributes.values
			#csv << product.attributes.values_at(*column_names)
		end
	end
end


end
