module ApplicationHelper
	def format_date(date)
		if date.nil?
			""
		else
			date.strftime("%d/%m/%Y")
		end
	end
end
