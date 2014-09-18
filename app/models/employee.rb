class Employee < ActiveRecord::Base
  attr_accessible :designation, :email, :emp_id, :name
  has_one :location
  validates :name,:email,:emp_id,:designation,:presence => true

  def self.import(file)

  spreadsheet = open_spreadsheet(file)
  header = spreadsheet.row(1)
  (2..spreadsheet.last_row).each do |i|
    row = Hash[[header, spreadsheet.row(i)].transpose]
    employee = Employee.find_by_emp_id(row['EmpId'])

    if not employee
    	employee = Employee.new()
    	employee.name = row['Name']
    	employee.emp_id = row['EmpId']
    	employee.email = row['Email']
    	employee.designation = row['Designation']
    	employee.save
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
