# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Ftc.create!([{ code: 'A123' , exception: 1 , shortdesc: 'test' , longdesc: 'moretest'},
# 	{ code: 'A555' , exception: 0 , shortdesc: '555test' , longdesc: 'more555test'}
# 	])


spreadsheet = Roo::Spreadsheet.open('./import/ICD_10_Codes/icd10cm_order_2016_original.xlsx')

spreadsheet.each(code: 'code', exception: 'exception', shortdesc: "shortdesc", longdesc: "longdesc") do |hash|
  #puts hash.inspect

if hash[:code] == "code"
	puts hash.inspect
else
	Ftc.create!( code: hash[:code], exception: hash[:exception], shortdesc: hash[:shortdesc], longdesc: hash[:longdesc] )
end

end

