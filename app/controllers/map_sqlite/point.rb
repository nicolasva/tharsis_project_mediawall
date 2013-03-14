def get_point_end(point_end_id,connectionsqliteshapes)
		tab_result_get_point_end = connectionsqliteshapes.execute("select * from points where id=#{point_end_id}")
		tab_result_get_point_end
end

class Point
	def initialize(floor_id,connectionsqliteshapes)
		@connectionsqliteshapes = connectionsqliteshapes
		@floor_id = floor_id
		@array_total = Array.new
		@array_result = Array.new
	end

	def get_points
		tab_result_points = @connectionsqliteshapes.select_total("points", "floor_id", @floor_id)
		tab_result_points.each{ |result_points|
			@array_result.clear
			position_start_x = result_points[9]
			Rails.logger.info "position_start_x =-=-=-=-=- #{position_start_x}-=-=-=-=-=-=-=-=-=-=-"
			position_start_y = result_points[10]
			Rails.logger.info "position_start_y =-=-=-=-=- #{position_start_y}-=-=-=-=-=-=-=-=-="
			#@array_result.push(position_start_x, position_start_y,get_point_end(result_points[4])[0][3],get_point_end(result_points[4])[0][4])
			Rails.logger.info "position_end_x =-=-=-=-=-=- #{get_point_end(result_points[4],@connectionsqliteshapes)[0][3]}-=-=-=-=-=-=-=-=-="
			Rails.logger.info "position_end_y =-=-=-=-=-=- #{get_point_end(result_points[4],@connectionsqliteshapes)[0][4]}"
			@array_total.push([result_points[6],position_start_x,position_start_y,get_point_end(result_points[4],@connectionsqliteshapes)[0][3],get_point_end(result_points[4],@connectionsqliteshapes)[0][4],result_points[4]])
		}
		@array_total	
	end

	def self.point_exist?(x,y,connectionsqliteshapes)
		result = true
		tab_point = connectionsqliteshapes.execute("select * from points where position_x=#{x} and position_x=#{y}")
		result = tab_point[0] unless tab_point.empty?
		result
	end

	def self.verif_origin_point_drag?(id_point,connectionsqliteshapes)
		result = false
		#result = true if connectionsqliteshapes.execute("select * from link where type_2='blocks' and type_1='points' and id_1=#{id_point}").empty?
		result = true if Logos.verif_logos?(id_point,connectionsqliteshapes) 
		result = true if connectionsqliteshapes.execute("select * from paths where point_start_id=#{id_point} or point_end_id=#{id_point}").empty?
		result
	end
end
