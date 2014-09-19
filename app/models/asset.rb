class Asset < ActiveRecord::Base

  attr_accessible :asset_type, :make, :model, :service_tag
  belongs_to :category
  has_many :custom_fields
  attr_accessible :custom_fields_attributes
  accepts_nested_attributes_for :custom_fields,                                 
                                :reject_if => lambda { |attrs| attrs.all? { |key, value| value.blank? } },
                                :allow_destroy => true
 
  has_many :assignments
  has_many :employees, :through=> :assignments

  def self.import(file)

  spreadsheet = open_spreadsheet(file)
  header = spreadsheet.row(1)
  (2..spreadsheet.last_row).each do |i|
    row = Hash[[header, spreadsheet.row(i)].transpose]
    asset = Asset.find_by_service_tag(row['ServiceTag'])
    if not asset
    	asset = Asset.new()
    	asset.asset_type = row['AssetType']
    	asset.make = row['Make']
    	asset.model = row['Model']
    	asset.service_tag = row['ServiceTag']
    	asset.save
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
