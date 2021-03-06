module CommonUtils
	
	def CommonUtils.get_current_time
		Time.zone.now
	end

	def CommonUtils.format_date_time(time)
		#Default time format
		date_time_format = "%d/%m/%Y %H:%M"
		CommonUtils.tz_convert(time).strftime(date_time_format) if !time.nil?
	end

	def CommonUtils.tz_convert(time_at)
		# Converting to local time
		time_at.in_time_zone
	end
end