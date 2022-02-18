class RentalEquip < ApplicationRecord
	has_many :as_rentalequips
        has_many :equipment, through: :as_rentalequips
#        has_many :rnums, through: :as_rentalequips


	def self.import(file)
	  spreadsheet = open_spreadsheet(file)
	  header = spreadsheet.row(1)
	  (2..spreadsheet.last_row).each do |i|
	    # row = Hash[[header, spreadsheet.row(i)].transpose]
	    row = spreadsheet.row(i)
	    product = new
	    product.name=row[0]
	    product.r_num=row[1]
	    product.rental_at=String(Integer(row[2]))+"-10-"+String(Integer(row[3]))+" "+String(Integer(row[4]))+":"+String(Integer(row[5]))+":00"
	    product.return_at=String(Integer(row[2]))+"-10-"+String(Integer(row[6]))+" "+String(Integer(row[7]))+":"+String(Integer(row[8]))+":00"
	    product.no_text=row[9]
	    product.g_name=row[10]
	    product.r_name=row[11]
	    product.tell="0"+String(Integer(row[12]))
	    product.save!
	  end
	end

	def self.open_spreadsheet(file)
	  case File.extname(file.original_filename)
	  when ".csv" then Csv.new(file.path, nil, :ignore)
	  when ".xls" then Excel.new(file.path, nil, :ignore)
	  when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
	  else raise "Unknown file type: #{file.original_filename}"
	  end
	end




end
