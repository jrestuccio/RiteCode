class I10gem < ActiveRecord::Base

has_many :icd9s
has_many :icd10s

def self.import(file)

    spreadsheet = Roo::Spreadsheet.open(file)
    ActiveRecord::Base.transaction do
        spreadsheet.each(i10code: 'i10code', i9code: 'i9code', approximate: 'approximate', nomap: 'nomap', 
            combination: 'combination', scenario: 'scenario', choicelist: 'choicelist') do |hash|
            if hash[:i10code] == "i10code"
                #puts hash.inspect
            else
                I10gem.create!( i10code: hash[:i10code], i9code: hash[:i9code], approximate: hash[:approximate],
                    nomap: hash[:nomap], combination: hash[:combination], scenario: hash[:scenario], 
                    choicelist: hash[:choicelist])       
            end
        end 
    end
end
    
    


def self.to_csv(options = {})
    CSV.generate(options) do |csv|
        csv << column_names
        all.each do |i10gem|
            csv << i10gem.attributes.values
            #csv << product.attributes.values_at(*column_names)
        end
    end
end


end
