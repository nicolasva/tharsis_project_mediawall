class FormatTime
	def initialize(dif_time)
		@dif_time = dif_time
	end

        private
	def traitement_time?
		#dif_day = @day_max - @day_min	
		if @dif_time <= 86400
			3600
		else
			if @dif_time > 86400 && @dif_time <= 2419200
				86400
			else
				if @dif_time > 2419200 && @dif_time <= 10364400
					604800
				else
					#604800
					2419200
				end
			end
		end 
		
	end

	def get_interval_time_max?	
		if @dif_time <= 86400
			60
		else
			if @dif_time > 86400 && @dif_time <= 2419200
				3600
			else
				if @dif_time > 2419200 && @dif_time <= 10364400
					#604800
					86400
				else
					604800
					#2419200
				end
			end
		end 
	end

	def format_strftime?
		#dif_day = @day_max - @day_min
		if @dif_time <= 86400
			"%H"	
		else
			if @dif_time > 86400 && @dif_time <= 2419200
				"%a %d"
			else
				#I18n.locale == :fr ? '%b %Y' : '%Y %b'
				
				"#{I18n.t("statistics.semaine")} %d %b"
			end
			#"%a %d"
		end
	end
end
