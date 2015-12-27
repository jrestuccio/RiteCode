class Ftc < ActiveRecord::Base

# this checks uniqueness of the code based on the user id.
validates_uniqueness_of :code, :scope => :user, :message => "already exists"

# this should delete
belongs_to :user, :dependent => :destroy

def self.import(file)
	spreadsheet = Roo::Spreadsheet.open(file)

	ActiveRecord::Base.transaction do
		spreadsheet.each(code: 'code', shortdesc: "shortdesc", longdesc: "longdesc") do |hash|
			if hash[:code] == "code"
				#puts hash.inspect
			else
				Ftc.create( code: hash[:code],  shortdesc: hash[:shortdesc], longdesc: hash[:longdesc], user: current_or_guest_user)

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
