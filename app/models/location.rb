class Location < ActiveRecord::Base
  attr_accessible :location_code, :name, :location_id, :status,:employee_id,:location_type
  # LOCATIONS = ["B0","B1","B2","E3","D3","D4"]
   belongs_to :floor, class_name: "Location",
                          foreign_key: "location_id"
   scope :floors ,:conditions=>"location_id = 0"
   scope :sublocations ,:conditions=>"location_id != 0"

  validates :name,:location_type,:location_code,:presence => true

  belongs_to :employee

  def self.import(file)

  spreadsheet = open_spreadsheet(file)
  header = spreadsheet.row(1)
  (2..spreadsheet.last_row).each do |i|
    row = Hash[[header, spreadsheet.row(i)].transpose]
    location = Location.find_by_location_code(row['LocationCode'])

    if not location
    	fl =  row['Floor'].strip.to_s
    	loc = Location.floors.select {|floor| floor.name == fl}


if loc
    	location = Location.new()
    	location.location_id = loc.first.id
    	location.name = row['Name']
    	location.location_code = row['LocationCode']
    	location.location_type = row['LocationType']
    	if row['LocationType'] == "Cabin"
    	    employee = Employee.find_by_emp_id(row['EmpId'])
    	  if employee
    	 location.employee_id = employee.id
    	end
    	end
    	location.status = "Active"
    	location.save
    end
    end
   
   

   end
  end

  def self.open_spreadsheet(file)
  	case File.extname(file.original_filename)
  	 when '.csv' then Roo::Csv.new(file.path, nil, :ignore)
  	 when '.xls' then Roo::Excel.new(file.path, nil, :ignore)
  	 when '.xlsx' then Roo::Excelx.new(file.path, nil, :ignore)
  	 else raise "Unknown file type: #{file.original_filename}"
    end
  end


end
