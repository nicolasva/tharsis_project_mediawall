def logos(block_id,connectionsqlite)
	Rails.logger.info "logos -=-=-=-=-=-=-=-=-=-=-=-=- select * from blocks,link,logos where blocks.id=link.id_1 and logos.id=link.id_2 and type_2='logos' and type_1='blocks' and blocks.id=#{block_id}"
	tab_result_logos = connectionsqlite.execute("select * from blocks,link,logos,translations where blocks.name_id=translations.id and blocks.id=link.id_1 and logos.id=link.id_2 and type_2='logos' and type_1='blocks' and blocks.id=#{block_id}")
	tab_result_logos
end
	
class Logos
  def initialize(floor_id,connectionsqliteshapes)
		@connectionsqliteshapes = connectionsqliteshapes
		@floor_id = floor_id
		@tab_array_result_logos = Array.new
  end

  def get_logos
	tab_blocks = get_blocks
	tab_blocks.each{ |blocks|
		#tab_result_logos = @connectionsqliteshapes.execute("select * from blocks,link,logos where blocks.id=link.id_1 and logos.id=link.id_2 and type_2='logos' and type_1='blocks' and blocks.id=#{blocks[15]}")
		tab_result_logos = logos(blocks[15],@connectionsqliteshapes)
		@tab_array_result_logos.push([blocks[0].to_i,blocks[3].to_f,blocks[4].to_f,tab_result_logos[0][9],tab_result_logos[0][13].to_f,tab_result_logos[0][14].to_f,tab_result_logos[0][19],tab_result_logos[0][0]]) 
	}
	@tab_array_result_logos
  end

  def add_logos_plans(x,y,block_id)
	tab_points_max_floor = @connectionsqliteshapes.execute("select max(id) from points where floor_id=#{@floor_id}")
	max_id = tab_points_max_floor[0][0].to_i + 1
	name_point = "Point_#{max_id}"
	id_insert = @connectionsqliteshapes.insert("translations", "'name'", "'#{name_point}'")
	id_points = @connectionsqliteshapes.insert("points","'name_id','description_id','position_x','position_y','floor_id','pathreference_id'","#{id_insert},#{id_insert+1},#{x},#{y},#{@floor_id},-1")
	id_link = @connectionsqliteshapes.insert("link","","#{id_points},#{block_id},'points','blocks'")
  end
	 
  def self.verif_logos?(point_id,connectionsqlite)
	connectionsqlite.execute("select * from link where type_2='blocks' and type_1='points' and id_1=#{point_id}").empty?
  end

  private
  def get_blocks	
	Rails.logger.info "select * from points,link,blocks where points.id=link.id_1 and blocks.id=link.id_2 and type_1='points' and type_2='blocks' and floor_id=#{@floor_id}"
	tab_logos = @connectionsqliteshapes.execute("select * from points,link,blocks where points.id=link.id_1 and blocks.id=link.id_2 and type_1='points' and type_2='blocks' and floor_id=#{@floor_id}")
  	tab_logos
  end  
end
