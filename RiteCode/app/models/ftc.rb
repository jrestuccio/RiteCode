class Ftc < ActiveRecord::Base


	def self.to_csv(options = {}) #generates csv format of database
		CSV.generate(options) do |csv|
			csv << ["Code", "Exception", "Short Desc", "Long Desc"]
			all.each do |ftc|
				csv << [ftc.code, ftc.exception, ftc.shortdesc, ftc.longdesc] 
			end	
		end
	end


	def self.import(file)
		CSV.foreach(file.path) do |row|
			Ftc.create! row.to_hash
		end
	end


end
