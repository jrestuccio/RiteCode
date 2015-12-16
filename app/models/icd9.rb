class Icd9 < ActiveRecord::Base

belongs_to :i9gem
belongs_to :i10gem

def self.import(file)

    spreadsheet = Roo::Spreadsheet.open(file)
    ActiveRecord::Base.transaction do
        spreadsheet.each(code: 'code', shortdesc: "shortdesc", longdesc: "longdesc") do |hash|
            if hash[:code] == "code"
                #puts hash.inspect
            else
                Icd9.create!( code: hash[:code], shortdesc: hash[:shortdesc], longdesc: hash[:longdesc] )       
            end
        end 
    end
end
    
    


def self.to_csv(options = {})
    CSV.generate(options) do |csv|
        csv << column_names
        all.each do |icd9|
            csv << icd9.attributes.values
            #csv << product.attributes.values_at(*column_names)
        end
    end
end

  def code_and_discrip
    "#{code}: #{shortdesc}"
  end

end
