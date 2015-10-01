# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Ftc.create!([{ code: 'A123' , exception: 1 , shortdesc: 'test' , longdesc: 'moretest'},
	{ code: 'A555' , exception: 0 , shortdesc: '555test' , longdesc: 'more555test'}



	])


xlsx = Roo::Spreadsheet.open('./import/ICD_10_Codes/icd10cm_order_2016.xlsx')
header = xlsx.row(1)

xlsx.each(code: 'Code', exception: 'Exception', shortdesc: "Short Description", longdesc: "Long Description") do |hash|
  puts hash.inspect
  # => { id: 1, name: 'John Smith' }
end

