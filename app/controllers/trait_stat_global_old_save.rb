class TraitGlobalStat 
	def initialize(dif_time,table,time,time_max_comparate,user_role_id,application_serial,time_column)
		@dif_time = dif_time
		@table = table
		@time = time
		@time_max_comparate = time_max_comparate
		@hash_colonne_gruff = Hash.new
		@hash_time_colonne_special = Hash.new
		@hash_time_colonne_gruff = Hash.new
		@user_role_id = user_role_id
		@application_serial = application_serial
		@time_column = time_column
	end

	def get_hash_colonne_gruff
		trait_stat
		@hash_colonne_gruff
	end

	def get_hash_time_colonne_gruff
		@hash_time_colonne_gruff
	end

	private
	def trait_stat(dif_time)
			time_plus = @time + @dif_time
			while time_plus < @time_max_comparate
				@table.colonnes.each{ |colonne|
					#colonne.contenus.find(:all, :conditions=>"contenu='#{tab_application[i].to_s}'", :group=>:idinsert).each{ |contenu|
					#time_column = colonne.time_column
					affichagecolonne = colonne.affichagecolonne
					champsspecial = colonne.champsspecial
					#Rails.logger.info "-=-=-=-=#{champsspecial}-=-=-"
					colonne.contenus.find(:all, :group=>:idinsert).each{ |contenu|
					     unless contenu.nil?
						    idinsert = contenu.idinsert
						    contenus_applications = Statistic::Contenu.find :first, :conditions=>"contenu='#{@application_serial.to_s}' and idinsert=#{idinsert}"
						    unless contenus_applications.nil?
							contenus_time = Statistic::Contenu.find :all, :conditions=>"contenu>'#{@time.to_i}' and contenu<'#{time_plus.to_i}' and idinsert=#{idinsert} and colonne_id=#{@time_column}"
							unless contenus_time.nil?
									#fdfdsfdsfd
									#tab_colonne_gruff.push(contenus_time.length)
									#Rails.logger.info "-=-=-=-=-=-=-=-=-=-=-=-=-=-#{contenus_time.length}-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
							   #if time_column == 0 && affichagecolonne
                                                            if @user_role_id == 1
							      if @hash_time_colonne_special["#{@time.to_i}_#{time_plus.to_i}"].nil?
								   @hash_time_colonne_special["#{@time.to_i}_#{time_plus.to_i}"] = 0
							      end

							      unless contenus_time.empty?
								contenus_time.each{ |contenu_time|
								#Rails.logger.info "-=-=ifdsfdfsdfdsfsdfdsfdsfsdfdsfsdfsdfsdfsdfdsfdsfdsfsdfdsfsdfsdfsdfsdfsdfsdf-=-=#{champsspecial}-=-=-"
									#if champsspecial
										#hash_colonne_gruff = Hash.new
										#hash_time_colonne_special = Hash.new
										#hash_time_colonne_special["#{time.to_i}_#{time_plus.to_i}"]
										#hash_colonne_gruff[contenu_time.contenu.to_s].nil? ? hash_colonne_gruff[contenu_time.contenu.to_s] = 1 : hash_colonne_gruff[contenu_time.contenu.to_s] += 1 
										#hash_time_colonne_special["#{time.to_i}_#{time_plus.to_i}"] = hash_colonne_gruff		
										#hash_time_colonne_special["#{time.to_i}_#{time_plus.to_i}"] += 1
										#hash_colonne_gruff[contenu_time.contenu.to_s] = hash_time_colonne_special
									#	Rails.logger.info "-=-=-=-=-=-#{time.to_i}_#{time_plus.to_i}-=-=-#{contenu_time.contenu.to_s}=-=-=-=#{hash_colonne_gruff[contenu_time.contenu.to_s]}-=-=-=-=-=-=-"
									#else
										@hash_time_colonne_special["#{@time.to_i}_#{time_plus.to_i}"] += 1	
										@hash_colonne_gruff[colonne.name.to_s] = @hash_time_colonne_special
										#Rails.logger.info "-=-=-=-#{time.to_i}_#{time_plus.to_i}-=-=#{colonne.name.to_s}-=-=-#{hash_colonne_gruff[colonne.name.to_s]}-=-=-=-fdsfsdfdsf=-=-=-"
									#end
								}
							      else
									unless champsspecial	
										@hash_time_colonne_special["#{@time.to_i}_#{time_plus.to_i}"] = 0
										
										@hash_colonne_gruff[colonne.name.to_s] = @hash_time_colonne_special

										#Rails.logger.info "-=-=-=-conditions______test=-=-=-"
									end
							      end
							     end
							     #end
									@hash_time_colonne_gruff["#{@time.to_i}_#{time_plus.to_i}"].nil? ? @hash_time_colonne_gruff["#{@time.to_i}_#{time_plus.to_i}"] = contenus_time.length : @hash_time_colonne_gruff["#{@time.to_i}_#{time_plus.to_i}"] += contenus_time.length		 
							end
						    end
					     end
						
					}
					@time = time_plus
					time_plus += @dif_time
				}
			end
	end
	
end

class TraitGlobalStatDate < TraitGlobalStat
	def initialize(table,day_min,month_min,year_min,hour_min,minute_min,day_max,month_max,year_max,hour_max,minute_max)
		super(table,time,time_max_comparate,user_role_id,application_serial,time_column)
		@day_min = day_min
		@month_min = month_min	
		@year_min = year_min
		@hour_min = hour_min
		@minute_min = minute_min
		@day_max = day_max
		@month_max = month_max
		@year_max = year_max
		@hour_max = hour_max
		@minute_max = minute_max
	end

	def trait_stat_time()
		trait_stat(traitement_time,get_time_locale_min?,get_time_locale_max?,choix_hash_result)
	end

	private
	def traitement_time
		dif_day = @day_max - @day_min
		dif_month = @month_max - @month_min
		dif_year = @year_max - @year_min
	
		if dif_day <= 1 && dif_month == 0 && dif_year == 0
			3600
		else
			if dif_day > 1 && dif_month == 0 && dif_year == 0
				86400
			else
				if dif_month > 1 && dif_month < 4
					
				else
					
				end
			end
		end	
	end

	def get_time_locale_min?	
		if dif_day <= 1 && dif_month == 0 && dif_year == 0
			Time.local(@year_min, @month_min, @day_min, @hour_min, @minute_min)
		else
			if dif_day > 1 && dif_month == 0 && dif_year == 0
				Time.local(@year_min, @month_min, @day_min)
			else
				if dif_month > 1 && dif_month < 4
					
				else
					
				end
			end
		end	
	end

	def get_time_locale_max?
		if dif_day <= 1 && dif_month == 0 && dif_year == 0
			Time.local(@year_max, @month_max, @day_max, @hour_max, @minute_max)
		else
			if dif_day > 1 && dif_month == 0 && dif_year == 0
				Time.local(@year_max, @month_max, @day_max)
			else
				if dif_month > 1 && dif_month < 4
					
				else
					
				end
			end
		end	
	end 
end
