class Ftc < ActiveRecord::Base

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
