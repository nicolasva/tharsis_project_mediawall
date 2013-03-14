require "#{RAILS_ROOT}/app/controllers/traitement_fichier_decompression.rb"
require "#{RAILS_ROOT}/app/controllers/ftp_public/ftp_public.rb"
require "#{RAILS_ROOT}/app/models/database_filesqlite.rb"
require "#{RAILS_ROOT}/vendor/plugins/2DMotor/2Dmotor"
require "#{RAILS_ROOT}/app/controllers/map_sqlite/translation_map.rb"
require "#{RAILS_ROOT}/app/controllers/map_sqlite/proportionimage.rb"
require "#{RAILS_ROOT}/app/controllers/map_sqlite/repositionaxe.rb"
require "#{RAILS_ROOT}/app/controllers/map_sqlite/point.rb"
require "#{RAILS_ROOT}/app/controllers/map_sqlite/logos.rb"
require "#{RAILS_ROOT}/app/controllers/map_sqlite/gestion_temp_map.rb"

class FichiercompressionsController < ApplicationController
  before_filter :verif_acces_user_controller, :except=>[:getcurrentversion, :version_file, :set_version_apps]
  CHEMIN = YAML::load_file("#{RAILS_ROOT}/config/conf_path_edit_filezip.yml")
  CHEMIN_CONF_TABLE_LIAISON = YAML::load_file("#{RAILS_ROOT}/config/conf_gestion_join_sqlite.yml")
  CONF_MAP = YAML::load_file("#{RAILS_ROOT}/config/conf_map.yml")
  CONF_PATH = "#{RAILS_ROOT}/config/conf_map.yml"

  def initialize
	@connectionsqlite = ""
  end

  def index
    #application = Application.find(params[:id])
    #@zips = application.avoirs.zip.paginate(:per_page => ByPage.new("zips").page, :page => params[:page])
	#@chemin = CHEMIN
	#@application = Application.find(params[:id])
	#@avoirs = @application.avoirs.find(:all, :order=>"fichiercompression_id desc") 
  	#@avoirs = @application.avoirs.paginate(:per_page => ByPage.new("fichiercompressions").page, :page => params[:page], :order=>"fichiercompression_id desc")
        #@zips = avoir.zip.find :all
	@fichiercompressions = Fichiercompression.all
    	@avoir = Avoir.find(params[:avoir_first_id])
    	@groupapp = @avoir.application.groupapp
  end

  def show
    #require "net/ftp"
    #@zip = Zip.find(params[:id])
    #if params[:id] = "getcurrentversion"
    #	    fichiercompression = Fichiercompression.find :first, :conditions=>"currentversion=1"
    #	     render :text=>fichiercompression.id
    #end
    #fichiercompression = Fichiercompression.find(params[:id])
    #ftp = Net::FTP.new(CONFIG_FTP["identifiant"]["hostname"],CONFIG_FTP["identifiant"]["username"],CONFIG_FTP["identifiant"]["password"])
    #	fichiercompression.get_version_apps(ftp, fichiercompression.file.url.scan(/^(.{1,}.zip)?.{1,}$/)[0][0]) if File.directory?("#{RAILS_ROOT}/public#{fichiercompression.file.url.scan(/^(.{1,})\/.{1,}.zip?.{1,}$/)[0][0]}") && !File.exists?("#{RAILS_ROOT}/public#{fichiercompression.file.url.scan(/^(.{1,}.zip)?.{1,}$/)[0][0]}") 
    #ftp.close

    #redirect_to(fichiercompression.file.url)
  end

  def filepdfimg
  	#require "rmagick"	
	@fichiercompression = Fichiercompression.find(params[:id].to_i)
	#Dir::mkdir("#{RAILS_ROOT}/public/zip/#{self.id.to_s}")	
  	#exemple : /zip/85/guide_integration_PAYLINE_v1.9.pdf?1293457409
	#@fichiercompression.file_file_name
	unless File.exist?("#{RAILS_ROOT}/public/zip/#{@fichiercompression.id}/#{@fichiercompression.file_file_name.scan(/^(.{1,}).pdf$/)[0][0]}")
		Dir::mkdir("#{RAILS_ROOT}/public/zip/#{@fichiercompression.id}/#{@fichiercompression.file_file_name.scan(/^(.{1,}).pdf$/)[0][0]}") 
		pdf = Magick::ImageList.new("#{RAILS_ROOT}/public/zip/#{@fichiercompression.id}/#{@fichiercompression.file_file_name}")
		0.upto(pdf.length-1){ |i|
			pdf[i].write("#{RAILS_ROOT}/public/zip/#{@fichiercompression.id}/#{@fichiercompression.file_file_name.scan(/^(.{1,}).pdf$/)[0][0]}/#{@fichiercompression.file_file_name.scan(/^(.{1,}).pdf$/)[0][0]}_#{i}.png") unless File.exist?("#{RAILS_ROOT}/public/zip/#{@fichiercompression.id}/#{@fichiercompression.file_file_name.scan(/^(.{1,}).pdf$/)[0][0]}_#{i}.png")
		}
	end

  end

  def detailimgpdf
  	@fichiercompression = Fichiercompression.find(params[:id])
  end

  #def getcurrentversion
  #  require "net/ftp"
  #  @user_session = UserSession.new(params[:users])
  #  if @user_session.save
  #    unless params[:id].nil?
  #	application = Application.find :first, :conditions=>"serial='#{params[:id]}'"
  #	unless application.nil?
  #	     avoir = application.avoirs.find :first, :conditions=>"currentversion=1"
	     	#avoir_id_version = application.avoirs.find(params[:id_version].to_i)
		    
		#get_zip_borne(application_id,avoir_current_version,id_version_actually)
   #		Rails.logger.info "params_id_version-=-=-=-=-=-=-=-=-#{params[:id_version]}-=-=-=-=-=-=-"
   #	     	if Avoir.count(:all, :conditions=>["fichiercompression_id > ? and fichiercompression_id <= ? and application_id = ?" ,params[:id_version].to_i, avoir.fichiercompression.id,application.id]) > 1
   #			render :text=>avoir.nil? ? 0 : "#{avoir.fichiercompression.id}\n #{get_zip_borne(application.id,avoir,params[:id_version].to_i)}"
   #		else
   #			FileUtils.mkdir_p("#{RAILS_ROOT}/public#{avoir.fichiercompression.file.url.scan(/^(.{1,})\/.{1,}.zip?.{1,}$/)}") unless File.directory?("#{RAILS_ROOT}/public#{avoir.fichiercompression.file.url.scan(/^(.{1,})\/.{1,}.zip?.{1,}$/)}")
		       	
		    #ftp = Net::FTP.new(CONFIG_FTP["identifiant"]["hostname"],CONFIG_FTP["identifiant"]["username"],CONFIG_FTP["identifiant"]["password"])
		    #	avoir.fichiercompression.get_version_apps(ftp, avoir.fichiercompression.file.url.scan(/^(.{1,}.zip).{1,}$/)[0][0]) if File.directory?("#{RAILS_ROOT}/public#{avoir.fichiercompression.file.url.scan(/^(.{1,})\/.{1,}.zip.{1,}$/)}")
		    #ftp.close
    #			render :text=>avoir.nil? ? 0 : "#{avoir.fichiercompression.id}\n /zip_ftp/#{avoir.fichiercompression.id}/#{avoir.fichiercompression.file_file_name}"
    #	     	end
		#render :text=>avoir.zip.id
    #	else
    #		render :text=>0
    # 	end
    # else
    #		render :text=>0
    # end
 	     #render :text=>params[:id]
    #else
    #		render :text=>0
    #end
  #end
  
  def getcurrentversion
  	@user_session = UserSession.new(params[:users])
	if @user_session.save
	     unless params[:id].nil?
  		application = Application.find :first, :conditions=>"serial='#{params[:id]}'"
		unless application.nil?
			avoir = application.avoirs.find(:first, :conditions=>{:currentversion=>1})
			if params[:id_version].to_i != avoir.fichiercompression.id
				render :text=>"#{avoir.fichiercompression.id}\n /zip_ftp/#{avoir.fichiercompression.id}/#{avoir.fichiercompression.file_file_name}"	
		        else
				render :text=>0
			end
		else
			render :text=>0
		end
	     else
		     render :text=>0
	     end
	else
		render :text=>0
	end
  end

  def version_file	
	@user_session = UserSession.new(params[:users])
	if @user_session.save
		fichiercompression = Fichiercompression.find(params[:fichiercompressions][:id])
		render :text=>fichiercompression.nil? ? 0 : fichiercompression.file.url	
	else
		render :text=>0
	end
  end

  def getversion
	  @fichiercompression = Fichiercompression.find(params[:version])
	  render :text=>"<body onload=\"document.location.href='#{@fichiercompression.file.url}'\"></body>"
  	#render :text=>@zip.file.url
  end

  def new
   @tab_list_ftp = Ftp.new(current_user.username).list
   if flash[:fichiercompression].nil?
    	   @fichiercompression = Fichiercompression.new
   else
	   @tab_apps_select = Array.new
    	   @tab_apps_select = flash[:applications_select]
	   @fichiercompression = flash[:fichiercompression]
   end
  end

  def floorprecedent
		imgflooractuel = params[:imgflooractuel]
		imgfloorprecedent = imgflooractuel.to_i - 1
              if imgflooractuel == 1
			redirect_to(:back)
	      else
			redirect_to :controller=>"fichiercompressions", :action=>"editfilepublic", :imgflooractuel=>imgfloorprecedent, :id=>params[:id]
	      end
  end

  def floorsuivant
		sessionfiledb = session["sessionfiledb"]
		file_db = sessionfiledb.filedb
		@connectionsqlite = ConnectionSqlite.new(filedb)
		imgflooractuel = params[:imgflooractuel].to_i
		imgfloorsuivant = imgflooractuel + 1	
 		#@connectionsqlite = ConnectionSqlite.new(file_db)
        	@tab_result = @connectionsqlite.select_total("floors","id","#{imgfloorsuivant.to_s}")
		flash[:notice] = t("fichiercompressions.last_scale") if @tab_result.empty?
		redirect_to :controller=>"fichiercompressions", :action=>"editfilepublic", :imgflooractuel=>(@tab_result.empty? ? imgflooractuel : imgfloorsuivant), :id=>params[:id]
  end

  def floor
	sessionfiledb = session["sessionfiledb"]
	filedb = sessionfiledb.filedb
	@connectionsqlite = ConnectionSqlite.new(filedb)
	floor = params[:floor].to_i
	#@connectionsqlite = ConnectionSqlite.new(filedb)
	@tab_result = @connectionsqlite.select_total("floors","id",floor.to_s)	
	flash[:notice] = t("fichiercompressions.last_scale")  if @tab_result.empty?
	redirect_to :controller=>"fichiercompressions", :action=>"editfilepublic", :imgflooractuel=>floor, :id=>params[:id]
  end

  def file_write(file_bin,url,type_ecriture)
      if File.open(url, type_ecriture) do |f|
	   f.write file_bin
         end
      else
	Rails.logger.info "test erreur_=_=_=_=_=_=_=_=_="
      end
      url
  end

	# Convert string to hexa blob (2 positions per hex)
	def to_hex( str )
  		ret = ""
  		str.each_byte do |c|
    			ret << format("%02X", c)
  		end
  		ret
	end

	# Convert hexa blob (2 positions per hex) back into string
	def to_string( hex_blob )
  		str = ''
  		hex_blob.gsub(/[[:xdigit:]]{2}/) { |x| str << x.hex.chr }
  		str
	end

	def convert_IEEE754(nombre_binaire)
		exponent = nombre_binaire.scan(/^.{1,1}(.{2,8})/).to_s.to_i(2)
		bin = nombre_binaire.scan(/(.{1,23})$/).to_s
		#bin = '10110011001100110011010'
		signe = (nombre_binaire.scan(/^.{1,30}(.{1,1})/).to_s.to_i == 0 ? 1 : -1)
		somme = 0
		compteur = -1
		bin.each_byte{ |l|
			c = l.chr
			#puts c.to_i
			somme += c.to_i*(2**compteur)
			#puts somme
			compteur += -1
			#puts "fdsfsdf"
		}

		dif_exponent= exponent - 127
		#(-1)sign bit *   (1+fraction)  * 2 exponent - bias
		result = signe*(1+somme)*2**(exponent-127)
		#puts exponent
		#puts somme
		result.round	
	end

  def write_file_bin(file_bin)	
		File.open("#{RAILS_ROOT}/app/controllers/binary_file.dat", "wb") { |f|
  			f.write file_bin
		}
  end

  def file_binary_temp(file_bin)
		write_file_bin(file_bin)

		compteur_total = (file_bin.size.to_i / 4)	
		compteur_file = 0
		tab_float_binary = Array.new			
		File.open("#{RAILS_ROOT}/app/controllers/binary_file.dat", "rb") { |f|
			while compteur_file < compteur_total
				val = f.read(4).unpack("f")
				if val.to_s.to_i != 0
  					tab_float_binary.push(val) 
				end
				compteur_file += 1
      end
		}	
		tab_float_binary
  end

  def get_connect_sqlite
	@connectionsqlite
  end
  
  def svg_zone_bis
		drawing = SVuGy::Document.new(800, 800) do
			#im = image(0, translation_y, tab_floor_bin[2].to_s.to_f*2, tab_floor_bin[3].to_s.to_f*2, "http://localhost:3000/img_sqlite/floor/floor.png")
			#im = image(20, 30, 550, 550, "/img_sqlite/line_png/line.png").style(:id=>'id_line')
			#rect(:rectangle_2, 0, 700, 96, -33).stroke_width(5).stroke(:blue) do 
			#	fill :none
			#end

			#rect(:rectangle_3, 0, 700, 58, -107).stroke_width(5).stroke(:red) do 
			#	fill :none
			#end


			
			#file_write(tab_result_shapes[0][3],"#{RAILS_ROOT}/public/img_sqlite/floor/floor.png","wb")
  				 ph2 = path {
					    style {
      						fill :transparent
      						stroke :red
      						stroke_width 1
    					    }

					#M tab_float_bin[0], 1.upto(tab_float_bin.length-1){ |y| print tab_float_bin.values_at(y).to_s.to_i }
					#M val_first_bin, tab_float_bin.each{ |polyline|  polyline }	
					#M val_first_bin, tab_float_bin.each{ |polyline| polyline.to_f }
					#0.upto(tab_polyline.length-1){ |y| 
					#	tab_polyline.values_at(y).to_s.to_i, tab_polyline.values_at(y)+1.to_s.to_i
					#}
  				  }
				  ph2.style(:id=>"id_zone_shapes", :class=>"zone_shapes")
			        #}
	
		end
		
		"<embed src='/img_sqlite/floor_svg/floor.svg' type='image/svg+xml' width='800' height='800'>"
  end

  def svg_zone(floor_id,position_x,position_y,points,file_bin,proportion)
		sessionfiledb = session["sessionfiledb"]
		filedb = sessionfiledb.filedb
		connectionsqlite = ConnectionSqlite.new(filedb)
		#connectionsqlite = get_connect_sqlite
		svg_zone_bis
		#dsgdfgdfgdfg
		#require 'float-formats'
		#Rails.logger.info "-=-=-=-=-=-=-=-position_x : #{position_x}"
		#Rails.logger.info "-=-=-=-=-=-=-=-position_y : #{position_y}"
		proportionimage = ProportionImage.new(proportion)
		sessionfiledb = session["sessionfiledb"]
		filedb = sessionfiledb.filedb
		tab_get_point = Array.new
  		logos = Logos.new(floor_id,connectionsqlite)
		tab_get_logos = logos.get_logos
		point = Point.new(floor_id,connectionsqlite)
		#imgl = Magick::ImageList.new
		#imgl.new_image(200, 200){
		#	self.background_color = 'none'
		#}
		#imgl.opaque('#CCCCCC00', "#CCCCCC00")
		#gc = Magick::Draw.new
		tab_get_point = point.get_points
		#	0.upto(tab_get_point.length-1){ |p|
		#			x1 = tab_get_point[p][1].to_f
		#		        y1 = tab_get_point[p][0].to_f

		#			x2 = tab_get_point[p][3].to_f
		#			y2 = tab_get_point[p][2].to_f

					#x1 = tab_get_point[p][1].to_f + 100.to_f
				        #y1 = tab_get_point[p][0].to_f + 200.to_f

					#x2 = tab_get_point[p][3].to_f + 100.to_f
					#y2 = tab_get_point[p][2].to_f + 200.to_f
		#			dif_x = (x2-x1)*2
		#			dif_y = (y2-y1)*2
		#			x2_redim = x2 + dif_x
		#			y2_redim = y2 + dif_y
					#x1 = x1 + dif_x
					#y1 = y1 + dif_y
					#l = line x1.to_f, y1.to_f, x2, y2
					#l.style(:stroke=>"yellow")
		#			gc.line(x1.to_f,y1.to_s, x2.to_f, y2.to_f)
		#			gc.stroke('yellow')
		#	}
		#	gc.draw(imgl)
		#	imgl.write("#{RAILS_ROOT}/public/img_sqlite/line_png/line.png")
		#Rails.logger.info "tab_get_point = #{tab_get_point[0][2]} -=-=-=-=-="
		#connectionsqliteshapes = ConnectionSqlite.new(filedb)	
		file_write(file_bin,"#{RAILS_ROOT}/public/img_sqlite/floor/floor.png","wb")
		#file_png(file_bin,"wb")
		#(x,y,largeur_x, largeur_y)
		tab_floor_bin = Array.new
		tab_floor_bin = file_binary_temp(points)
		repositionaxe = RepositionAxe.new(tab_floor_bin[1].to_s.to_f)
		translation_y = repositionaxe.reposition_plans(tab_floor_bin[1].to_s.to_f)
		position_y = repositionaxe.reposition_plans(tab_floor_bin[3].to_s.to_f) 
		#Rails.logger.info "-=-=-=-=-=-=-=-=-=-translation_y : #{translation_y}=-=-=-=-=-=-=-=-=-position_y : #{position_y}-=-=-=-=-=-=-=-=-=-=-=-=-=" 
		drawing = SVuGy::Document.new(tab_floor_bin[0].to_s.to_f + proportionimage.proportion(tab_floor_bin[2].to_s.to_f), tab_floor_bin[1].to_s.to_f + proportionimage.proportion(tab_floor_bin[3].to_s.to_f)) do
			#im = image(0, translation_y, tab_floor_bin[2].to_s.to_f*2, tab_floor_bin[3].to_s.to_f*2, "http://localhost:3000/img_sqlite/floor/floor.png")
			im = image(0, translation_y, proportionimage.proportion(tab_floor_bin[2].to_s.to_f), proportionimage.proportion(tab_floor_bin[3].to_s.to_f), "/img_sqlite/floor/floor.png").style(:id=>'BackDrop')	
			#im = image(20, 30, 550, 550, "/img_sqlite/line_png/line.png").style(:id=>'id_line')
			#rect(:rectangle_2, 0, 700, 96, -33).stroke_width(5).stroke(:blue) do 
			#	fill :none
			#end

			#rect(:rectangle_3, 0, 700, 58, -107).stroke_width(5).stroke(:red) do 
			#	fill :none
			#end

			0.upto(tab_get_point.length-1){ |p|
					x1 = tab_get_point[p][2].to_f+100
				        y1 = tab_get_point[p][1].to_f+100

					x2 = tab_get_point[p][4].to_f+100
					y2 = tab_get_point[p][3].to_f+100
  				   ph1 = path {
					    style {
      						fill :transparent
      						stroke :yellow
      						stroke_width 1
    					    }

					#M tab_float_bin[0], 1.upto(tab_float_bin.length-1){ |y| print tab_float_bin.values_at(y).to_s.to_i }
					#M val_first_bin, tab_float_bin.each{ |polyline|  polyline }	
					M proportionimage.proportion(x1.to_f), proportionimage.proportion(y1.to_f), proportionimage.proportion(x2.to_f), proportionimage.proportion(y2.to_f)
					#0.upto(tab_polyline.length-1){ |y| 
					#	tab_polyline.values_at(y).to_s.to_i, tab_polyline.values_at(y)+1.to_s.to_i
					#}
  				  }
				  ph1.translate(proportionimage.proportionTranslate, proportionimage.proportionTranslate).style(:class=>"class_chemin")

				circle(proportionimage.proportion(x1.to_f), proportionimage.proportion(y1.to_f), proportionimage.proportioncircledefaut).style(:stroke=>:yellow, :fill=>:red, :class=>"circle_point_red", :id=>"id_circle_point_red_#{tab_get_point[p][0]}").translate(proportionimage.proportionTranslate, proportionimage.proportionTranslate)
				circle(proportionimage.proportion(x2.to_f), proportionimage.proportion(y2.to_f), proportionimage.proportioncircledefaut).style(:stroke=>:yellow, :fill=>:red, :class=>"circle_point_red", :id=>"id_circle_point_red_#{tab_get_point[p][5]}").translate(proportionimage.proportionTranslate, proportionimage.proportionTranslate)


			}
	
			tab_result_shapes = connectionsqlite.select_total("shapes", "floor_id", floor_id)
			
			#file_write(tab_result_shapes[0][3],"#{RAILS_ROOT}/public/img_sqlite/floor/floor.png","wb")
			0.upto(tab_result_shapes.length-1){ |i|
				File.open("#{RAILS_ROOT}/app/controllers/binary_file.dat", "wb") { |f|
  					f.write tab_result_shapes[i][3]
				}

				#Rails.logger.info "-=-=-=-=-=-=-=-=-=-=-=-#{tab_result_shapes[i][3].size}-=-=-=-=-=-=-=-=-=-=-"
				compteur_total = tab_result_shapes[i][3].nil? ? 0 : (tab_result_shapes[i][3].size.to_i / 4)	
				#Rails.logger.info "-=-=-=-=-=-=-=-=-=-=-=-#{compteur_total}-=-=-=-=-=-=-=-=-=-=-"
				compteur_file = 0
				compteur_old_file = 0
				tab_float_bin = Array.new
				File.open("#{RAILS_ROOT}/app/controllers/binary_file.dat", "rb") { |f|
				     while compteur_file < compteur_total
				       compteur_old_file += 1
				       if compteur_old_file < 3
					      #if compteur_old_file == 2
  						#tab_float_bin.push(repositionaxe.reposition_plans(f.read(4).unpack("f").to_s.to_f))  
  						#tab_float_bin.push(f.read(4).unpack("f").to_s.to_f) 
					      #else
  						tab_float_bin.push(proportionimage.proportion(f.read(4).unpack("f").to_s.to_f)) 
					     # end
				       else
						f.read(4).unpack("f")
						compteur_old_file = 0
				       end
				     	compteur_file += 1
                                     end
				}


				compteur_bininv = 0
				while compteur_bininv < tab_float_bin.length
					val = tab_float_bin[compteur_bininv]
					#Rails.logger.info "=-=-=-=-=-=-=-=-val = #{val}-=-=-=-=-=-=-#{tab_float_bin[compteur_bininv+1]}"
					tab_float_bin[compteur_bininv] = tab_float_bin[compteur_bininv+1]
					tab_float_bin[compteur_bininv+1] = val	
					compteur_bininv += 2
				end	

				#Rails.logger.info "-=-=-=-=-=-=-=-=-=-=-=-#{tab_float_bin.length} #{tab_float_bin[2]}-=-=-=-=-=-=-=-=-=-=-"
				#0.upto(tab_float_bin.length-1){ |it|
				#	Rails.logger.info "=-=-=-=-=-=-=-#{it}-=-=-=-=-=-=-=-=-=-#{tab_float_bin[it]}-=-=-=-=-=-=-=-=-=-=-=-"
				#}
				#	Rails.logger.info "-=-=-=-=-=-=-=fin-=-=-=-=-=-=-=-"
				val_first_bin = tab_float_bin[0].to_s.to_f
				tab_float_bin.delete_at(0) 
				#}
  				 ph2 = path {
					    style {
      						fill :black
      						stroke :red
      						stroke_width 1
    					    }

					#M tab_float_bin[0], 1.upto(tab_float_bin.length-1){ |y| print tab_float_bin.values_at(y).to_s.to_i }
					#M val_first_bin, tab_float_bin.each{ |polyline|  polyline }	
					M val_first_bin, tab_float_bin.each{ |polyline| polyline.to_f }
					#0.upto(tab_polyline.length-1){ |y| 
					#	tab_polyline.values_at(y).to_s.to_i, tab_polyline.values_at(y)+1.to_s.to_i
					#}
  				  }
				  ph2.style(:id=>"zone_shapes_id_#{tab_result_shapes[i][0].to_i}", :class=>"zone_shapes", :opacity=>"0.3")
			        #}


				group_translate_y = repositionaxe.reposition_plans(tab_result_shapes[i][5].to_f) 
				#g3 = group.style(:id=>tab_result_shapes[i][0].to_i){ 
					#tab_result_shapes.each{ |result_shapes|	
					    translations = Translations.new("shapes",tab_result_shapes[i][0],filedb)
					    resulttranslate = translations.resulttranslation

					   unless resulttranslate == false || resulttranslate.empty? 
	    
					   text(resulttranslate ? (I18n.locale == :fr ? (resulttranslate[0][2].empty? ? resulttranslate[0][1] : resulttranslate[0][2]) : (resulttranslate[0][4].empty? ? resulttranslate[0][1] : resulttranslate[0][4])) : "", p1 = pt(proportionimage.proportion(tab_result_shapes[i][5].to_f + tab_result_shapes[i][8].to_f) , proportionimage.proportion(tab_result_shapes[i][4].to_f + tab_result_shapes[i][7].to_f))).style(:id=>tab_result_shapes[i][0].to_i, :font_size=>proportionimage.proportiontextdefaut, :class=>"class_theme_map", :text=>resulttranslate ? (I18n.locale == :fr ? (resulttranslate[0][2].empty? ? resulttranslate[0][1] : resulttranslate[0][2]) : (resulttranslate[0][4].empty? ? resulttranslate[0][1] : resulttranslate[0][4])) : "")
					  anchor("/fichiercompressions/supnameshapes?shapes_id=#{tab_result_shapes[i][0].to_i}~proportion=#{proportion}").style(:class=>"class_liens_sup_shapes", :id=>"id_sup_shapes_#{tab_result_shapes[i][0].to_i}"){
					  	image(proportionimage.proportion(tab_result_shapes[i][5].to_f + tab_result_shapes[i][8].to_f), proportionimage.proportion(tab_result_shapes[i][4].to_f + tab_result_shapes[i][7].to_f), 20, 20, "/images/img_general/close.gif").style(:id=>"id_shapes_sup_#{tab_result_shapes[i][0].to_i}", :class=>"class_sup_shapes")
					  }

					  else 
					   	text("", p1 = pt(proportionimage.proportion(tab_result_shapes[i][5].to_f + tab_result_shapes[i][8].to_f) , proportionimage.proportion(tab_result_shapes[i][4].to_f + tab_result_shapes[i][7].to_f))).style(:id=>tab_result_shapes[i][0].to_i, :class=>"class_theme_map")
					  end
					
			}

			tab_get_logos.each{ |logos|
				im = image(proportionimage.proportion(logos[2].to_f), proportionimage.proportion(logos[1].to_f), proportionimage.proportion(logos[4].to_f), proportionimage.proportion(logos[5].to_f), "/img_sqlite/logos/logos_#{logos[3].to_i}.png").style(:id=>"id_logos_#{logos[0].to_i}", :class=>"logos_image")	
				circle(proportionimage.proportion(logos[2].to_f), proportionimage.proportion(logos[1].to_f), proportionimage.proportioncircledefaut).style(:stroke=>:yellow, :fill=>:yellow, :id=>"id_point_logo_#{logos[0].to_i}", :class=>"circle_point")	
				text(logos[6], pt(proportionimage.proportion(logos[2].to_f), proportionimage.proportion(logos[1].to_f)+40)).style(:font_size=>9, :fill=>"orange" ,:id=>"id_text_block_#{logos[0].to_i}", :class=>"class_text_block_logos", :text=>logos[6])

				anchor("/fichiercompressions/suplogosplans?point_id=#{logos[0].to_i}~block_id=#{logos[7]}~proportion=#{proportion}").style(:class=>"class_liens_sup_logos", :id=>"id_liens_sup_logo_#{logos[0].to_i}"){
					 image(proportionimage.proportion(logos[2].to_f)+3, proportionimage.proportion(logos[1].to_f)-14, 15, 15, "/images/img_general/close.gif").style(:id=>"id_logos_sup_#{logos[0].to_i}", :class=>"class_sup_logos")
				}
			}
		end
		
		File.open("#{RAILS_ROOT}/public/img_sqlite/floor_svg/floor.svg", "w+") do |f|
			f.write drawing.to_svg
		end
		"<embed src='/img_sqlite/floor_svg/floor.svg' type='image/svg+xml' width='#{tab_floor_bin[0].to_s.to_f + proportionimage.proportion(tab_floor_bin[2].to_s.to_f) + 1}' height='#{tab_floor_bin[1].to_s.to_f + proportionimage.proportion(tab_floor_bin[3].to_s.to_f) + 1}'>"
  end

  def get_list_topics_marques(marque_id)	
	sessionfiledb = session["sessionfiledb"]
	filedb = sessionfiledb.filedb
	@connectionsqlite = ConnectionSqlite.new(filedb)
	#connectionsqlite = ConnectionSqlite.new(filedb)
	Rails.logger.info "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-select * from link,topics,translations where link.id_1=topics.id and topics.name_id=translations.id and type_1='topics' and type_2='topics' and id_2=#{marque_id}-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-" 
	@tab_topics_marques = @connectionsqlite.execute("select * from link,topics,translations where link.id_1=topics.id and topics.name_id=translations.id and type_1='topics' and type_2='topics' and id_2=#{marque_id}")
	@tab_topics_marques
  end

  def get_verif_non_exist_soustheme(topics_id)
	sessionfiledb = session["sessionfiledb"]
	filedb = sessionfiledb.filedb
	@connectionsqlite = ConnectionSqlite.new(filedb)
	#connectionsqlite =ConnectionSqlite.new(filedb)
	Rails.logger.info "select * from link where id_1=#{topics_id} where type_1='topics' and type_2='topics'" 
	tab_link = @connectionsqlite.execute("select * from link where id_1=#{topics_id} and type_1='topics' and type_2='topics'")
	tab_link.empty? ? true : false
  end

  def get_logos_blocks(id_blocks)
	sessionfiledb = session["sessionfiledb"]
	filedb = sessionfiledb.filedb
	@connectionsqlite = ConnectionSqlite.new(filedb)
	#connectionsqlite = ConnectionSqlite.new(filedb)

	Rails.logger.info "select * from link,logos where link.id_2=logos.id and type_1='blocks' and type_2='logos' and id_1=#{id_blocks}"
	tab_logos_blocks = @connectionsqlite.execute("select * from link,logos where link.id_2=logos.id and type_1='blocks' and type_2='logos' and id_1=#{id_blocks}")
	tab_logos_blocks
  end

  def get_topics_blocks(id_blocks)
	sessionfiledb = session["sessionfiledb"]
	filedb = sessionfiledb.filedb
	@connectionsqlite = ConnectionSqlite.new(filedb)
	#connectionsqlite = ConnectionSqlite.new(filedb)

	Rails.logger.info "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-select * from translations,topics,link,blocks where translations.id=topics.name_id and topics.id=link.id_1 and blocks.id=link.id_2 and type_1='topics' and type_2='blocks' and blocks.id=#{id_blocks}-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-" 	
	tab_topics_blocks = @connectionsqlite.execute("select * from translations,topics,link,blocks where translations.id=topics.name_id and topics.id=link.id_1 and blocks.id=link.id_2 and type_1='blocks' and type_2='topics' and blocks.id=#{id_blocks}")
	tab_topics_blocks
  end

  def editfilepublic
	require "net/ftp"
	@proportionmap = YAML::load_file(CONF_PATH)
	sessionfiledb = SessionFileDB.new 
	fichiercompression = Fichiercompression.find(params[:id])
	tempmap = TempMap.new(fichiercompression.file.url,current_user.id)	
	file_db = tempmap.get_file_db
	if session["sessionfiledb"].nil?
		#Test local quand pas de connection internet direct commenté
		ftp = Net::FTP.new(CONFIG_FTP["identifiant"]["hostname"],CONFIG_FTP["identifiant"]["username"],CONFIG_FTP["identifiant"]["password"])	
			fichiercompression.get_version_apps(ftp, fichiercompression.file.url.scan(/^(.{1,}.zip).{1,}$/)[0][0]) if File.directory?("#{RAILS_ROOT}/public#{fichiercompression.file.url.scan(/^(.{1,})\/.{1,}.zip.{1,}$/)}")
		ftp.close
		#Fin Test local quand pas de connection internet direct commenté
	     fichiercompression.zip_decompression(fichiercompression.file.url.scan(/^(.{1,}\/.{1,}.zip).{1,}$/)[0][0]) unless File.directory?("#{RAILS_ROOT}/public/#{fichiercompression.file.url.scan(/^(.{1,}).zip.{1,}$/)[0][0]}") 
	     tempmap.construct_temp_map
	     sessionfiledb.filedb = file_db
 	     session["sessionfiledb"] = sessionfiledb
	     #system("rsync -r #{RAILS_ROOT}/public/zip/#{tab_fichiercompression[2]}/#{tab_fichiercompression[3].scan(/^(.{1,})\..{1,}$/).to_s}/#{CHEMIN["chemin"]} #{RAILS_ROOT}/public/temp_map/#{tab_fichiercompression[2]}/#{tab_fichiercompression[3].scan(/^(.{1,})\..{1,}$/).to_s}/#{CHEMIN["chemin"]}")    
	else
	     sessionfiledb = session["sessionfiledb"]
	     unless sessionfiledb.filedb == file_db	
		#Test local quand pas de connection internet direct commenté
		ftp = Net::FTP.new(CONFIG_FTP["identifiant"]["hostname"],CONFIG_FTP["identifiant"]["username"],CONFIG_FTP["identifiant"]["password"])	
			fichiercompression.get_version_apps(ftp, fichiercompression.file.url.scan(/^(.{1,}.zip).{1,}$/)[0][0]) if File.directory?("#{RAILS_ROOT}/public#{fichiercompression.file.url.scan(/^(.{1,})\/.{1,}.zip.{1,}$/)}")
		ftp.close
		#Fin Test local quand pas de connection internet direct commenté
	        fichiercompression.zip_decompression(fichiercompression.file.url.scan(/^(.{1,}\/.{1,}.zip).{1,}$/)[0][0]) unless File.directory?("#{RAILS_ROOT}/public/#{fichiercompression.file.url.scan(/^(.{1,}).zip.{1,}$/)[0][0]}") 
		tempmap.construct_temp_map
		#session.destroy :sessionfiledb
		sessionfiledb.filedb = file_db
		session["sessionfiledb"] = sessionfiledb	
	     end
 	     #file_db = sessionfiledb.filedb 
        end	
	@connectionsqlite = ConnectionSqlite.new(file_db)
	@chemin_table = CHEMIN_CONF_TABLE_LIAISON
 	#@connectionsqlite = ConnectionSqlite.new(file_db)
        @tab_result = @connectionsqlite.select_total("link","","")
        @tab_affichagetable = @chemin_table["affichagetable"]["link"]
	@tab_lienscolonne = @chemin_table["lienscolonne"]["link"]
	@tab_liste_floor = @connectionsqlite.select_total("floors", "", "")

	@tab_liste_translations = @connectionsqlite.select_total("translations","","")
        #connectionsqlitefloor = ConnectionSqlite.new(file_db)	
	@tab_result_floor = @connectionsqlite.select_total("floors", "id", "#{params[:imgflooractuel].to_s}")	
	#Rails.logger.info "select * from translations,topics left join link on link.id_2=topics.id and type_2='topics' and type_1='topics' where translations.id=topics.name_id group by id_2;"
	@tab_result_marque = @connectionsqlite.execute("select * from translations,topics left join link on link.id_2=topics.id and type_2='topics' and type_1='topics' where translations.id=topics.name_id group by id_2;")
	@tab_result_blocks = @connectionsqlite.execute("select * from blocks,translations where blocks.name_id=translations.id")
	@tab_result_logos = @connectionsqlite.execute("select * from logos,translations where logos.name_id=translations.id")
  end

  def publication_newversion
	    #-=-=-=-=-=-=-=-=-=-=-Example (filedb) = /home/nicolas/ruby/prj/newproject/public/temp_map/187/colorpicker/refresh_web/demo.map-=-=-=-=-=-=-=-=-=-=-=-#	
            #params[:fichiercompression][:file_content_type] = "application/zip"
            #params[:fichiercompression][:file_file_size] = File.size(file_file_name)
            #params[:fichiercompression][:file_updated_at] = Time.now
            #tab_file = params[:fichiercompression][:file_file_name].split("/")
	    #params[:fichiercompression][:file_file_name] = tab_file[tab_file.length-1]
	    sessionfiledb = session["sessionfiledb"]
            filedb = sessionfiledb.filedb
	    tempmap = TempMap.new(filedb,current_user.id)
	    #Rails.logger.info "filedb-=-=-=-=-=-=-=-=-=-=-#{filedb}-=-=-=-=-=-=-=-=-=-=-=-"
		#fdsfsdfsdf
	    fichiercompression = Fichiercompression.find(params[:id])
	    dossier_name = filedb.split("/")[10].to_s 
	    file_file_name = "#{dossier_name}.zip"
            file_content_type = fichiercompression.file_content_type
            file_file_size = fichiercompression.file_file_size
	    @fichiercompression = Fichiercompression.new(:file_file_name=>file_file_name, :file_content_type=>file_content_type, :file_file_size=>file_file_size)
	    if @fichiercompression.save
		#Rails.logger.info "fichiercompression.file =-=-=-=-=-=-=-=-=-=-=-= #{filedb.scan(/^.{1,}#{dossier_name}\/(.{1,})$/).to_s}"
		#vgfdgfdgdf
		@fichiercompression.edit_file(params[:id],%x[cat #{filedb}],filedb.scan(/^.{1,}#{dossier_name}\/(.{1,})$/).to_s) 
		flash[:notice] = t("controller.notice.fichiercompressions.positif") 
	    else
		flash[:notice] = t("controller.notice.fichiercompressions.negatif") 
	    end 
	    tempmap.destruct_temp_map
		redirect_to :controller=>"applications"
	    
  end

  def addblocksplans
	flash[:notice] = "Veuillez placer ce point ajouté"
	#redirect_to(:back)
	block_id = params[:id]
	floor_id = params[:floor_id]
	sessionfiledb = session["sessionfiledb"]
        filedb = sessionfiledb.filedb	
	@connectionsqlite = ConnectionSqlite.new(filedb)
	logos = Logos.new(floor_id,@connectionsqlite)
	logos.add_logos_plans(CONF_MAP["position_depart"]["x_position"],CONF_MAP["position_depart"]["y_position"],block_id)
	redirect_to(:back)			
	#@connectionsqlite.insert("points",)
  end

  def editlinks
	sessionfiledb = session["sessionfiledb"]
	filedb = sessionfiledb.filedb
	@connectionsqlite = ConnectionSqlite.new(filedb)
	@chemin_table = CHEMIN_CONF_TABLE_LIAISON
 	#@connectionsqlite = ConnectionSqlite.new(filedb)
        @tab_resulteditlogoscategories = @connectionsqlite.select_total(params[:table],"id",params[:id])
        @tab_affichagetable = @chemin_table["affichagetable"][params[:table]]
	@tab_lienscolonne = @chemin_table["lienscolonne"][params[:table]]
  end

  def edit
	  @fichiercompression = Fichiercompression.find(params[:id])
	  @groupapp_id = @fichiercompression.avoirs.first.application.groupapp_id
  end

  def list_file_directory
	@fichiercompression = Fichiercompression.find(params[:id])
	fichierzip = EDIT::FichierZip.new(params[:id],@fichiercompression.file_file_name.scan(/^(.{1,}).zip$/))
	@tab_list_file = fichierzip.read_list_file(params[:file])
	
  end

  def editfile
	@fichiercompression = Fichiercompression.find(params[:id])
	@fichierzip = EDIT::FichierZip.new(params[:id],@fichiercompression.file_file_name.scan(/^(.{1,}).zip$/)) 	
  end

  def updatefile
	contenufichier = params[:editfile][:contenu]
	fichiercompression_id = params[:editfile][:fichiercompression_id]
	file = params[:editfile][:file]
	
	#@fichiercompression = Fichiercompression.find(fichiercompression_id)
  	#@fichierzip = EDIT::FichierZip.new(fichiercompression_id,@fichiercompression.file_file_name.scan(/^(.{1,}).zip$/))
	#@fichierzip.write_file(contenufichier)
	oldfichier = Fichiercompression.find(params[:editfile][:fichiercompression_id])
	@fichiercompression = Fichiercompression.new(:file_file_name=>oldfichier.file_file_name, :file_content_type=>oldfichier.file_content_type, :file_file_size=>oldfichier.file_file_size)		
  	if @fichiercompression.save
		@fichiercompression.edit_file(oldfichier.id,contenufichier,file)
		#flash[:notice] = "L'édition de ce fichier s'est bien déroulé il est désormais disponible <a href='#{@fichiercompression.file.url}'>Télécharger le fichier Editer</a>"
		flash[:notice] = "#{t("controller.notice.fichiercompressions.updatefile.positif")} <a href='#{@fichiercompression.file.url}'>#{t("controller.notice.fichiercompressions.updatefile.liens_telechargement")}</a>"
	else
		#flash[:notice] = "L'édition de ce fichier ne s'est pas déroulé correctement il n'est pas disponible"
		flash[:notice] = t("controller.notice.fichiercompressions.updatefile.negatif")
	end
	redirect_to(:back)
  end

  def get_roles(role_id)
  	roles = Role.find(:all, :conditions=>"role_id=#{role_id}")
	tab_roles = role_id.to_s
	unless roles.empty?
	roles.each{ |role|	
		tab_roles += "-#{get_roles(role.id).to_s}"
	}
	end

	tab_roles
  end

  def get_sha_ftp(url_ftp)
	  require 'digest/sha2'
	  file_h = Digest::SHA2.new
	  File.open(url_ftp, 'r') do |fh|
	  	fh.each_line do |l|
			file_h << l
		end
	  end
	  Rails.logger.info "-=-=-=-=-=-=-=-=sha-#{file_h.to_s.upcase}"
	  file_h.to_s.upcase
  end

  def set_version_apps
  	@user_session = UserSession.new(params[:users])
  	
	if @user_session.save
		if params[:fichiercompression][:file_file_name].nil? || params[:fichiercompression_avoir][:application_id].nil? || params[:fichiercompression][:currentversion].nil?
			render :text=>0
		else 
			user = User.find(:first, :conditions=>{:username=>params[:users][:username]})
 		      #if get_sha_ftp("#{RAILS_ROOT}/public/ftp/#{user.username}/#{params[:fichiercompression][:file_file_name]}") == params[:sha].to_s
			params[:fichiercompression][:file_content_type] = "application/zip"
			params[:fichiercompression][:file_file_size] = File.size("#{RAILS_ROOT}/public/ftp/#{user.username}/#{params[:fichiercompression][:file_file_name]}") 
			params[:fichiercompression][:file_updated_at] = Time.now
      			params[:fichiercompression][:description] = (params[:fichiercompression][:description].nil? || params[:fichiercompression][:description].empty? ? Time.now.strftime("%Y/%m/%d %H:%M:%S") : params[:fichiercompression][:description])
			@fichiercompression = Fichiercompression.new(params[:fichiercompression])

			if @fichiercompression.save
				result = 1
				#render :text=>@fichiercompression.traitement_version_apps(params[:fichiercompression_avoir][:application_id][0].split(","),(params[:application][:forceupdate].nil? || params[:application][:forceupdate].to_i == 0 ? false : true),user.username)
		     		tab_applications = params[:fichiercompression_avoir][:application_id][0].split(",") 
		   		0.upto(tab_applications.length-1){ |i|
		   			result = 0 unless @fichiercompression.create_avoir(tab_applications[i].to_i)  
		   		}

				if result == 1
					ftp = Net::FTP.new(CONFIG_FTP["identifiant"]["hostname"],CONFIG_FTP["identifiant"]["username"],CONFIG_FTP["identifiant"]["password"])
						@fichiercompression.send_file_ftp(ftp)	
					ftp.close	
				end
	    			File.delete("#{RAILS_ROOT}/public/#{@fichiercompression.file.url.scan(/^(.{1,}.zip)?.{1,}$/)[0][0]}")	
				render :text=>result
			else
			      render :text=>0
		      end
		end
	else
		render :text=>0
	end
  end

  def create
  if params[:all_licences_type_apps].nil?
   tab_applications = Array.new
   if params[:fichiercompression][:file].nil? && params[:fichiercompression][:file_file_name].nil?
   	flash[:notice] = t("controller.notice.fichiercompression.create.notice_file_nil")
   else
    if params[:fichiercompression][:file].nil?
	file_file_name = params[:fichiercompression][:file_file_name]
        #if file_file_name.scan(/^.{1,}\.(.{1,})$/).to_s == "zip" || file_file_name.scan(/^.{1,}\.(.{1,})$/).to_s == "pdf"
	    require 'mime/types'
	    #size_file_size = File.size(file_file_name)
            params[:fichiercompression][:file_content_type] = MIME::Types.type_for(file_file_name).first.content_type
            params[:fichiercompression][:file_file_size] = 1545 #File.size(file_file_name)
            params[:fichiercompression][:file_updated_at] = Time.now
            tab_file = file_file_name.split("/")
	    params[:fichiercompression][:file_file_name] = tab_file[tab_file.length-1]
        #else
         #   flash[:notice] = t("controller.notice.fichiercompressions.create.notice_format")
        #end
     end

     #if params[:choix_update] == "all"
   #	tab_roles = get_roles(current_user.role_id).to_s
#	tab_roles = tab_roles.split("-")

 #       0.upto(tab_roles.length-1){ |i|
#		applications = Application.find(:all, :conditions=>"role_id=#{tab_roles[i]} and groupapp_id=#{params[:type]}")
#		applications.each { |application|
#			tab_applications.push(application.id)
#		}	
#	}

	#Rails.logger.info "tab_applications-=-=-=-=-=-=-#{tab_applications}"
 #    else
	 #    tab_applications = params[:fichiercompression_avoir][:application_id]
  #   end
     
      if params[:fichiercompression_avoir].nil?   	
   	#tab_roles = get_roles(current_user.role_id).to_s
	#tab_roles = tab_roles.split("-")

        #0.upto(tab_roles.length-1){ |i|
		applications = Application.find(:all, :conditions=>"groupapp_id=#{params[:fichiercompression][:type_id]}")
		applications.each { |application|
			tab_applications.push(application.id)
		}	
	#}

	Rails.logger.info "tab_applications-=-=-=-=-=-=-#{tab_applications}"
      else
	 tab_applications = params[:fichiercompression_avoir][:application_id]
      end
      
      @fichiercompression = Fichiercompression.new(params[:fichiercompression])
      unless @fichiercompression.have_applications?
        if @fichiercompression.save
          Ftp.new(current_user.username).copy_file(tab_file[tab_file.length-1],@fichiercompression.id) if params[:fichiercompression][:file].nil?
	  if @fichiercompression.file_space?
	 	@fichiercompression = @fichiercompression.file_any_space! 
	  end
		0.upto(tab_applications.length-1){ |i|
			@fichiercompression.create_avoir(tab_applications[i].to_i)
		}	
	    ftp = Net::FTP.new(CONFIG_FTP["identifiant"]["hostname"],CONFIG_FTP["identifiant"]["username"],CONFIG_FTP["identifiant"]["password"])
	   	@fichiercompression.send_file_ftp(ftp) 
	    ftp.close
	    File.delete("#{RAILS_ROOT}/public/#{@fichiercompression.file.url.scan(/^(.{1,}.zip)?.{1,}$/)[0][0]}")	
          flash[:notice] = t("controller.notice.fichiercompressions.create.positif")
        else	
	  flash[:applications_select] = tab_applications.nil? ? params[:fichiercompression_avoir][:application_id] : tab_applications
	  flash[:fichiercompression] = @fichiercompression
        end
        redirect_to(:back)
      else
	flash[:notice] = "Veuillez creer des applications avant d'envoyer une version"
        redirect_to new_application_path
      end
    end
  else
	  groupapp = Groupapp.find(params[:fichiercompression][:type_id].to_i)
	  #redirect_to edit_avoir_path(groupapp.applications.first.avoirs.first.id)
  	  redirect_to :controller=>"fichiercompressions", :action=>"index", :avoir_first_id=>groupapp.applications.first.avoirs.first.id
  end
  end

  def select_files_apps_update
	 	@type = params[:id_type]
		#@application = Application.find(:first, :conditions=> ["role_id= ? and groupapp_id = ? ", current_user.role_id, params[:id_type].to_i], :joins=>[{:avoirs => :fichiercompression }]) 
		@application_currentversion = Application.find(:first, :conditions=>{:groupapp_id=>params[:id_type].to_i, :avoirs=>{:currentversion=>1}}, :joins=>[{:avoirs => :fichiercompression}])
		@application_base_version = Application.find(:first, :conditions=>{:groupapp_id=>params[:id_type].to_i, :avoirs=>{:fichiercompressions=>{:base_version=>1}}}, :joins=>[{:avoirs => :fichiercompression }])
  end

  def update
     result = true
     flash[:notice] = "L'association de ces applications à cette version s'est bien déroulé"
      @fichiercompression = Fichiercompression.find(params[:id])
     
      #@fichiercompression.avoirs.destroy
      tab_applications_ids = params[:fichiercompression][:application_ids]

      @fichiercompression.avoirs.update_all(:currentversion=>false)
      0.upto(tab_applications_ids.length-1).each{ |i|
      	Rails.logger.info "-=-=-=-=-=-=-application_id -=-=-=-=-=-=-#{tab_applications_ids[i]}"
	#@avoir = @fichiercompression.avoirs.new(:application_id=>application_id)
	result = false unless @fichiercompression.avoirs.find(:first, :conditions=>{:application_id=>tab_applications_ids[i].to_i}).update_attributes(:currentversion=>true)
      }

      flash[:notice] = "L'association de ces applications à cette version ne s'est pas déroulé correctement et n'est pas disponible" if result == false  

      #render :text => "test"
      #if @fichiercompression.save
      #		@fichiercompression.edit_fichiercompression_zip(params[:fichiercompressionold][:id])
      #		flash[:notice] = t("controller.notice.fichiercompressions.update.positif")
      #else
      #		flash[:fichiercompression] = @fichiercompression
		#flash[:notice] = "L'enregistrement du fichier ne s'est pas déroulé correctement il n'est pas disponible"
      #		flash[:notice] = t("controller.notice.fichiercompressions.update.negatif")
      #end
      #redirect_to(:back)
      result ? redirect_to(new_fichiercompression_path) : redirect_to(:back)
  end

  def destroy
    @fichiercompression = Fichiercompression.find(params[:id])
    @fichiercompression.destroy
    #@zip.applications.destroy_all
    @fichiercompression.deletefileorigin
    @fichiercompression.avoirs.destroy_all

    redirect_to(:back)
  end

  def validate_version_actuelle
	#avoir = Avoir.find(:all, :conditions=>{:currentversion=>true, :fichiercompression_id=>params[:fichiercompressions_version][:currentversion]})
	#avoir.update_attributes(:archive_currentversion=>true) unless avoir.nil?
	#Avoir.update_all("fichiercompression_id=#{params[:fichiercompressions_version][:currentversion].to_i}, c", "archive_currentversion=true")
	Avoir.update_all({:archive_currentversion=>true, :currentversion=>false}, {:application_id=>params[:fichiercompressions_version][:application_id], :currentversion=>true})
	#Avoir.update_all("currentversion=0", "application_id=#{params[:fichiercompressions_version][:application_id]}")


	@avoir = Avoir.find :first, :conditions=>"fichiercompression_id=#{params[:fichiercompressions_version][:currentversion]} and application_id=#{params[:fichiercompressions_version][:application_id]}"
	if @avoir.update_attributes(:currentversion=>true, :archive_currentversion=>false)	
		flash[:notice] = t("controller.notice.fichiercompressions.valid_current_version.positif")
	else
		flash[:notice] = t("controller.notice.fichiercompressions.valid_current_version.negatif")
	end

	redirect_to(:back)
  end

  def controlverifshapeslibre(floor_id,tab_liste_shapes)
	sessionfiledb = session["sessionfiledb"]
	filedb = sessionfiledb.filedb
	@connectionsqlite = ConnectionSqlite.new(filedb)
	shapes_id_valid = ""
	tab_liste_shapes.each{ |liste_shapes|
		Rails.logger.info "controlverif=-=-=-=-=-=-=-=-=-=-#{liste_shapes[0].to_s}-=-=-=-=-=-=-=-=-=-=-=-"	
		id_shapes = liste_shapes[0].to_s.to_i			
		#connectdatabasesqlite = ConnectionSqlite.new(filedb)
		tab_translations_shapes = @connectionsqlite.execute("select * from shapes,link,topics,translations where shapes.id=link.id_1 and link.id_2=topics.id and topics.name_id=translations.id and shapes.id=#{id_shapes} and floor_id=#{floor_id.to_i} group by name_id")	
		if tab_translations_shapes.empty? && shapes_id_valid.empty?
			shapes_id_valid = id_shapes
		end
	}
	shapes_id_valid
  end

  def addtranslationmap
	translation_id = params[:id]
	floor_id = params[:floor_id]
	sessionfiledb = session["sessionfiledb"]
	filedb = sessionfiledb.filedb
	@connectionsqlite = ConnectionSqlite.new(filedb)
	name_id = @connectionsqlite.execute("select max(name_id) from shapes where floor_id=#{floor_id.to_i}")
	tab_liste_info_translations = @connectionsqlite.select_total("translations","id",name_id)
	name = tab_liste_info_translations[0][1]
	id_name_sup = name.split("_")[1].to_i + 1
	id_insert_name_id = @connectionsqlite.insert("translations", "'name'", "'Shape_#{id_name_sup}'")
	id_shapes = @connectionsqlite.insert("shapes", "'name_id','center_x','center_y','center_z','center_modifier_x','center_modifier_y','center_modifier_z','height','select_possible','floor_id'","#{id_insert_name_id},#{CONF_MAP["position_depart"]["x_position"]},#{CONF_MAP["position_depart"]["y_position"]},0,0,0,0,0,0,#{floor_id}")
        tab_liste_info_topics = @connectionsqlite.execute("select * from topics where name_id=#{translation_id}") #db.execute("topics", "name_id", translation_id)
	#Rails.logger.info "=-=-=-=-=-==-=-=-=-=-=-=select * from topics where name_id=#{translation_id}-=-=-=-=-=-=-=-==-=-=-"
	if tab_liste_info_topics.empty?
		id_insert_topics = @connectionsqlite.insert("topics",'name_id,description_id,color_r,color_g,color_b,color_a,apply_color',"#{translation_id},0,0,0,0,0,0")
	else
		id_insert_topics = tab_liste_info_topics[0][0]
	end
	@connectionsqlite.insert("link","","#{id_shapes},#{id_insert_topics},'shapes','topics'")	
	#tab_liste_shapes = connectdatabasesqlite.select_total("shapes", "floor_id", floor_id)
	#shape_id_first = tab_liste_shapes[0][0].to_i	
	#shape_id_first = controlverifshapeslibre(floor_id,tab_liste_shapes)
	#Rails.logger.info "shape_id_first-=-=-=-=-=-=-#{shape_id_first}"
	#tab_info_topics = connectdatabasesqlite.select_total("topics", "name_id", params[:id])
	#id_info_topics = tab_info_topics[0][22]
	#Rails.logger.info "id_info_topics-=-=-=-=-=-=-=-=-=-=-#{id_info_topics}-=-=-=-=-=-=-=-"
	#connectdatabasesqlite.insert("link","#{shape_id_first},#{id_info_topics},'shapes','topics'")
        #connectdatabasesqlite.insert("shapes",)
	redirect_to(:back)
  end

  def remplacement_shapes
	sessionfiledb = session["sessionfiledb"]
	filedb = sessionfiledb.filedb
	@connectionsqlite = ConnectionSqlite.new(filedb)
	tab_shapes_id = params[:shapesname_origin]
	shapes_id_a_remplacer = tab_shapes_id.split("~")[0]
	shapes_id_pour_remplacage = tab_shapes_id.split("~")[1].split("=")[1] 
	#connectdatabasesqlite = ConnectionSqlite.new(filedb)
	Rails.logger.info "select * from link where id_1=#{shapes_id_pour_remplacage} and type_1='shapes'" 
	tab_link_shapes_pour_remplacage = @connectionsqlite.execute("select * from link where id_1=#{shapes_id_pour_remplacage} and type_1='shapes'")
	#tab_liste_info_shapes_pour_remplacage = connectdatabasesqlite.select_total("shapes", "id", shapes_id_pour_remplacage)	
	id_2_pour_remplacage = tab_link_shapes_pour_remplacage[0][2]
	tab_liste_verif_exist_shapes_a_remplacer = @connectionsqlite.execute("select * from link where id_1=#{shapes_id_a_remplacer} and type_1='shapes'")
      unless tab_liste_verif_exist_shapes_a_remplacer.empty?
	if @connectionsqlite.update("link", "id_2=#{id_2_pour_remplacage}","id_1=#{shapes_id_a_remplacer} and type_1='shapes'")
	#connectdatabasesqlite.update("shapes","name_id=#{name_id_pour_remplacage}", "id=#{shapes_id_a_remplacer}") #update(table,set_colonne,condition)
		render :text=>"test"
	else
		render :text=>"test"
	end
      else
		if @connectionsqlite.insert("link","","#{shapes_id_a_remplacer},#{id_2_pour_remplacage},'shapes','topics'")
			render :text=>"test"
		else
			render :text=>"test"
		end	
      end	
	      @connectionsqlite.delete("link", "id_1=#{shapes_id_pour_remplacage} and type_1='shapes'")
              tab_info_shapes_remplacages = @connectionsqlite.select_total("shapes", "id", shapes_id_pour_remplacage)
	      @connectionsqlite.delete("shapes", "id=#{shapes_id_pour_remplacage}") if tab_info_shapes_remplacages[0][3].to_s.empty?
  end

  def sup_logos_blocks
	sessionfiledb = session["sessionfiledb"]
	filedb = sessionfiledb.filedb
	@connectionsqlite = ConnectionSqlite.new(filedb)
	#connectdatabasesqlite = ConnectionSqlite.new(filedb)

	if @connectionsqlite.delete("link", "id=#{params[:id]}")
		flash[:notice] = t("controller.notice.fichiercompressions.sup_logos_blocks.positif")
	else
		flash[:notice] = t("controller.notice.fichiercompressions.sup_logos_blocks.negatif")
	end
	redirect_to(:back)	
  end	

  def supnameshapes	
	sessionfiledb = session["sessionfiledb"]
	filedb = sessionfiledb.filedb
	@connectionsqlite = ConnectionSqlite.new(filedb)
	shapes_id = params[:shapes_id].split("~")[0].to_i
	proportion = params[:shapes_id].split("~")[1].split("=")[1].to_i
	#connectdatabasesqlite = ConnectionSqlite.new(filedb)
	tab_detail_shapes = @connectionsqlite.select_total("shapes", "id", shapes_id)
	floor_id = tab_detail_shapes[0][12]
	#connectdatabasesqlite.update("shapes", "")
	if @connectionsqlite.delete("link", "id_1=#{shapes_id} and type_1='shapes'")
		flash[:notice] = t("controller.notice.fichiercompressions.supnameshapes.positif")
	else
		flash[:notice] = t("controller.notice.fichiercompressions.supnameshapes.negatif")
	end
	#Rails.logger.info "-=-=-=-=-=-=-=-=-=-=-=-=-#{params[:shapes_id]}-=-=-=-=-=-=-=-=-=-=-=-=-=-="
	redirect_to :controller=>"fichiercompressions", :action=>"affichage_svg", :floor_id=>floor_id, :proportion=>proportion
	#redirect_to(:back)
  end

  def suplogosplans
	sessionfiledb = session["sessionfiledb"]
	filedb = sessionfiledb.filedb
	id_point = params[:point_id].split("~")[0].to_i
	block_id = params[:point_id].split("~")[1].split("=")[1].to_i
	proportion = params[:point_id].split("~")[2].split("=")[1].to_i
	#render :text => block_id
	@connectionsqlite = ConnectionSqlite.new(filedb)
	info_point = @connectionsqlite.execute("select * from link,points where link.id_1=points.id and type_1='points' and type_2='blocks' and id_2=#{block_id}")

	if @connectionsqlite.delete("link", "id_2=#{block_id} and id_1=#{id_point} and type_1='points' and type_2='blocks'")
	   #Rails.logger.info "delete from link,blocks using link,points where link.id_1=points.id and type_2='blocks' and type_1='points' and id_2=#{block_id} and floor_id=#{info_point[0][12]}"
	   #@connectionsqlite.execute("delete from link using link,points where link.id_1=points.id and type_2='blocks' and type_1='points' and id_2=#{block_id} and floor_id=#{info_point[0][12]}")
		flash[:notice] = "La supression de ce logo s'est bien déroulé il n'est plus disponible dans la Map"
	else
		flash[:notice] = "La supression  de ce logo ne s'est pas déroulé correctement il est encore disponible dans la Map"
	end
	redirect_to :controller=>"fichiercompressions", :action=>"affichage_svg", :floor_id=>info_point[0][12], :proportion=>proportion	
	#render :text=>"test"
  end 

  def addnameshapes
	#shapes_id = params[:shapes_id]
	#sessionfiledb = session["sessionfiledb"]
	#filedb = sessionfiledb.filedb
	#connectdatabasesqlite = ConnectionSqlite.new(filedb)

	#tab_detail_shapes = connectdatabasesqlite.select_total("shapes",'id', shapes_id)
	#floor_id = tab_detail_shapes[0][12]
	#Rails.logger.info "floor_id=-=-=-=-=-=-=-=-=-=-=-=-#{floor_id}-=-=-=-=-=-=-=-=-=-=-=-=-=-"
         
	#redirect_to(:back)		
  end

  def valid_add_fichiercompressions
	sessionfiledb = session["sessionfiledb"]
	filedb = sessionfiledb.filedb
	@connectionsqlite = ConnectionSqlite.new(filedb)
	shapes_id = params[:addnameshapes][:id]
	#Rails.logger.info "shapes_id =-=-=-=-=-=-=-=-=- #{shapes_id} -=-=-=-=-=-=-=-=-"
	tab_filedb = filedb.split("/")
	Rails.logger.info "=-=-=-=-filedb=-=-=#{tab_filedb[9]}-=-=-=-=-=-"
	num_file = tab_filedb[9]
	#connectdatabasesqlite = ConnectionSqlite.new(filedb)		
	tab_detail_shapes = @connectionsqlite.select_total("shapes", "id", shapes_id)
	floor_id = tab_detail_shapes[0][12]
	translations_id = @connectionsqlite.insert("translations", "'name','text0','text1'","'#{params[:addnameshapes][:name]}','#{params[:addnameshapes][:text0]}','#{params[:addnameshapes][:text1]}'")
		topics_id = @connectionsqlite.insert("topics", "'name_id','description_id','color_r','color_g','color_b','color_a','apply_color'","#{translations_id},#{translations_id + 1},1,1,1,1,0")
		tab_link_verif_exist = @connectionsqlite.execute("select * from link where id_1=#{shapes_id.to_i} and type_1='shapes' and type_2='topics'")
		Rails.logger.info "select * from link where id_1=#{shapes_id.to_i} and type_1='shapes'"
		if tab_link_verif_exist.empty?
			@connectionsqlite.insert("link","","#{shapes_id},#{topics_id},'shapes','topics'")
		else
			@connectionsqlite.update("link", "id_2=#{topics_id}", "id_1=#{shapes_id} and type_1='shapes' and type_2='topics'")
		end
		 #redirect_to :controller=>"fichiercompressions", :action=>"editfilepublic", :id=>187, :imgflooractuel=>0
  		redirect_to :controller=>"fichiercompressions", :action=>"affichage_svg", :floor_id=>floor_id
   end

   def suptranslationmap
	sessionfiledb = session["sessionfiledb"]
	filedb = sessionfiledb.filedb
	@connectionsqlite = ConnectionSqlite.new(filedb)
	translation_id = params[:id]
	#connectdatabasesqlite = ConnectionSqlite.new(filedb)
	if @connectionsqlite.delete("translations", "id=#{translation_id}")
		tab_topics_translations = @connectionsqlite.select_total("topics", "name_id", translation_id)
		tab_topics_translations.each{ |topics_translations|
			id = topics_translations[0]
			@connectionsqlite.delete("link", "id_2=#{id}")
			@connectionsqlite.delete("link", "id_1=#{id}")
			@connectionsqlite.delete("topics", "id=#{id}")	
		}
		flash[:notice] = t("controller.notice.fichiercompressions.suptranslationmap.positif")
	else
		flash[:notice] = t("controller.notice.fichiercompressions.suptranslationmap.negatif")
	end
	redirect_to(:back)
   end

   def sup_topics_blocks
	sessionfiledb = session["sessionfiledb"]
	filedb = sessionfiledb.filedb
	@connectionsqlite = ConnectionSqlite.new(filedb)
	#connectdatabasesqlite = ConnectionSqlite.new(filedb)
	if @connectionsqlite.delete("link", "id=#{params[:id]}")
		flash[:notice] = t("controller.notice.fichiercompressions.sup_topics_blocks.positif")
	else
		flash[:notice] = t("controller.notice.fichiercompressions.sup_topics_blocks.negatif")
	end
	redirect_to(:back)
   end

   def sup_blocks	
	sessionfiledb = session["sessionfiledb"]
	filedb = sessionfiledb.filedb
	@connectionsqlite = ConnectionSqlite.new(filedb)
	#connectdatabasesqlite = ConnectionSqlite.new(filedb)
	if @connectionsqlite.delete("blocks", "id=#{params[:id]}")
		@connectionsqlite.delete("link", "id_1=#{params[:id]} and type_1='blocks'")
		flash[:notice] = t("controller.notice.fichiercompressions.sup_blocks.positif")
	else
		flash[:notice] = t("controller.notice.fichiercompressions.sup_blocks.negatif")
	end
	redirect_to(:back)
   end

   def sortable_marques_topics
	sessionfiledb = session["sessionfiledb"]
	filedb = sessionfiledb.filedb
	@connectionsqlite = ConnectionSqlite.new(filedb)
	id_shapes_emplacement = params[:id_shapes_emplacement]
	tab_params_topics = params["oltopicsmarques_#{id_shapes_emplacement}"]
        #connectdatabasesqlite = ConnectionSqlite.new(filedb)
	Rails.logger.info "select * from topics where name_id=#{id_shapes_emplacement}"
	tab_topics_emplacement = @connectionsqlite.execute("select * from topics where name_id=#{id_shapes_emplacement}")
	id_topics = tab_topics_emplacement[0][0]

	tab_params_topics.each{ |topics|
		Rails.logger.info "select * from topics,link where topics.id=link.id_1 and name_id=#{topics} and id_2=#{id_topics} and type_1='topics' and type_2='topics'"
		tab_detail_topics = @connectionsqlite.execute("select * from topics where name_id=#{topics}")
		id_marque = tab_detail_topics[0][0] 
		tab_marques_topics = @connectionsqlite.execute("select * from topics,link where topics.id=link.id_1 and name_id=#{topics} and id_2=#{id_topics} and type_1='topics' and type_2='topics'")

		if tab_marques_topics.empty?
			Rails.logger.info "update link set id_2=#{id_topics} where id_1=#{id_marque} and type_1='topics' and type_2='topics'"
			@connectionsqlite.execute_update("update link set id_2=#{id_topics} where id_1=#{id_marque} and type_1='topics' and type_2='topics'")
		end
  		#Rails.logger.info "select * from link where id_1=#{topics} and id_2=#{id_shapes_emplacement} and type_1='topics' and type_2='topics'" 
		#tab_result_exist_marques_topics = db.execute("select * from link where id_1=#{topics} and id_2=#{id_shapes_emplacement} and type_1='topics' and type_2='topics'")	
	}
	render :text=>id_topics
   end

   def sortable_logos_blocks_javascript
	result_register_logos_block = ""
	li_logos = params[:dragged_id]
	li_blocks = params[:dropped_id]
	
	logos_id = li_logos.split("_")[2].to_s
	blocks_id = li_blocks.split("_")[2].to_s

	sessionfiledb = session["sessionfiledb"]
	filedb = sessionfiledb.filedb
	@connectionsqlite = ConnectionSqlite.new(filedb)
	
	@connectionsqlite.insert("link", "'id_1','id_2','type_1','type_2'","#{blocks_id},#{logos_id},'blocks','logos'")
	Rails.logger.info "select * from link,logos where link.id_2=logos.id and id_1=#{blocks_id} and id_2=#{logos_id} and type_1='blocks' and type_2='logos'"
	tab_verif_logos_blocks = @connectionsqlite.execute("select * from link,logos where link.id_2=logos.id and id_1=#{blocks_id} and id_2=#{logos_id} and type_1='blocks' and type_2='logos'")
	unless tab_verif_logos_blocks.empty?
		result_register_logos_block = "<li><a href='/fichiercompressions/sup_logos_blocks/#{tab_verif_logos_blocks[0][0]}'>x</a><br><img src='/img_sqlite/logos/logos_#{tab_verif_logos_blocks[0][5]}.png' width='20' height='20'></li>"
	end
	render :text=>result_register_logos_block
   end

   def valid_add_logos_marques
	compteur_verif_update = true
   	sessionfiledb = session["sessionfiledb"]
	filedb = sessionfiledb.filedb
	block_id = params[:block_id]
	tab_logos_select = params[:logos][:check_logos]	
	@connectionsqlite = ConnectionSqlite.new(filedb)
	unless params[:logos][:logo].empty?
		image = params[:logos][:logo]
		size_x = params[:logos][:size_x]
		size_y = params[:logos][:size_y]
		nom_logo = params[:logos][:name_id]
		name_id = get_name_id_update_blog(name)
		id_logos = @connectionsqlite.insert("logos","'name_id','description_id','size_x','size_y','logo'","#{name_id},#{name_id+1},#{size_x},#{size_y},'#{image}'")
		@connectionsqlite.insert("link","'id_1','id_2','type_1','type_2'","#{block_id.to_i},#{id_logos}")
	end	

            0.upto(tab_logos_select.length-1){ |i|	
		compteur_verif_update = false unless @connectionsqlite.insert("link", "'id_1','id_2','type_1','type_2'","#{block_id.to_i},#{tab_logos_select[i]},'blocks','logos'")
	    }

	    if compteur_verif_update
	    	flash[:notice] = "L'ajout de ces logos pour cette marque s'est bien déroulé, ils sont désormais disponible"
	    else
		flash[:notice] = "L'ajout de ces logos pour cette marque s'est bien déroulé, ils sont désormais disponible"
	    end 

	    redirect_to(:back)
   end

   def sortable_marques_topics_javascript
	result_register_themes_marques = ""
	li_topics = params[:dragged_id]
	li_blocks = params[:dropped_id]
	
	topics_id = li_topics.split("_")[2].to_s
	blocks_id = li_blocks.split("_")[2].to_s
	#connectdatabasesqlite = ConnectionSqlite.new(filedb)

	#tab_topics = connectdatabasesqlite.select_total("topics", "name_id", id_topics)
	#topics_id = tab_topics[0][22]

	#tab_topics = connectdatabasesqlite.select_total("topics", "name_id", id_blocks)
	#blocks_id = tab_topics[0][22]

	sessionfiledb = session["sessionfiledb"]
	filedb = sessionfiledb.filedb
	@connectionsqlite = ConnectionSqlite.new(filedb)

	@connectionsqlite.insert("link", "'id_1','id_2','type_1','type_2'","#{blocks_id},#{topics_id},'blocks','topics'")

	Rails.logger.info "select * from link where id_1=#{blocks_id} and id_2=#{topics_id} and type_1='blocks' and type_2='topics'" 
	tab_verif_register = @connectionsqlite.execute("select * from link where id_1=#{blocks_id} and id_2=#{topics_id} and type_1='blocks' and type_2='topics'")
	unless tab_verif_register.empty?
		Rails.logger.info "select * from translations,topics,link where translations.id=topics.name_id and topics.id=link.id_1 and topics.id=#{topics_id}"
		tab_translations = @connectionsqlite.execute("select * from translations,topics,link where translations.id=topics.name_id and topics.id=link.id_1 and topics.id=#{topics_id}")	
		result_register_themes_marques = "<li><a href='/fichiercompressions/sup_topics_blocks/#{tab_translations[0][40]}'>x</a> #{tab_translations[0][2]}</li>"
	end
	render :text=>result_register_themes_marques
   end

   def set_position_logos
	params_position = params[:position_x]
	x = params_position.split("~")[0].to_f
	y = params_position.split("~")[1].to_s.split("=")[1].to_f	
	point_id = params_position.split("~")[2].to_s.split("=")[1].to_f
	x = ProportionImage.restaureproportion(x)
	y = ProportionImage.restaureproportion(y)
	sessionfiledb = session["sessionfiledb"]
	filedb = sessionfiledb.filedb
	@connectionsqlite = ConnectionSqlite.new(filedb)
	tab_result_link = @connectionsqlite.execute("select * from link,points where link.id_1=points.id and type_2='blocks' and type_1='points' and id_1=#{point_id}")
	
	sessionfiledb = session["sessionfiledb"]
	filedb = sessionfiledb.filedb
	@connectionsqlite = ConnectionSqlite.new(filedb)
	unless Point.point_exist?(x,y,@connectionsqlite)
		point_id_associe = Point.point_exist?(x,y,@connectionsqlite)
		@connectionsqlite.delete("link", "type_2='blocks' and type_1='points' and id_1=#{point_id} and id_2=#{tab_result_link[0][2]}")
		@connectionsqlite.delete("points","id=#{point_id}") if Point.verif_origin_point_drag?(point_id,@connectionsqlite)
		@connectionsqlite.delete("translations", "id=#{tab_result_link[0][6]}") if Point.verif_origin_point_drag?(point_id,@connectionsqlite)	
		@connectionsqlite.insert("link", "","#{point_id},#{tab_result_link[0][2]},'points','blocks'")
	else
		if Point.verif_origin_point_drag?(point_id,@connectionsqlite)
			@connectionsqlite.update("points","position_x=#{x},position_y=#{y}","id=#{point_id}")
		else
			logos = Logos.new(tab_result_link[0][12],@connectionsqlite)
			@connectionsqlite.delete("link", "type_2='blocks' and type_1='points' and id_1=#{point_id} and id_2=#{tab_result_link[0][2]}")
			logos.add_logos_plans(x,y,tab_result_link[0][2])
		end
		
	end
	#@connectionsqlite.update("points","position_x=#{x},position_y=#{y}","id=#{point_id}")
	#update("link", "id_2=#{id_2_pour_remplacage}","id_1=#{shapes_id_a_remplacer} and type_1='shapes'")	
	
	render :text=>"value x = #{x} value y = #{y} point_id = #{point_id}"
	#render :text=>y
   end

   def set_position_logos_circle_red
	sessionfiledb = session["sessionfiledb"]
	filedb = sessionfiledb.filedb
	@connectionsqlite = ConnectionSqlite.new(filedb)
	#render :text=>"set_position_logos_circle_red-=-=-=-=-=-=-#{params[:id_point_circle_id]}"
	id_point_circle_id = params[:id_point_circle_id].split("~")[0]
	id_point = params[:id_point_circle_id].split("~")[1].split("=")[1]
	#@connectionsqlite.update("link", "id_2=#{id_2_pour_remplacage}","id_1=#{shapes_id_a_remplacer} and type_1='shapes'")
	tab_verif_existence_point = @connectionsqlite.execute("select * from link where id_1=#{id_point_circle_id} and type_2='blocks' and type_1='points'")

	if tab_verif_existence_point.empty?	
		@connectionsqlite.update("link","id_1=#{id_point_circle_id}", "type_2='blocks' and type_1='points' and id_1=#{id_point}")
		@connectionsqlite.delete("points","id=#{id_point}") unless Point.verif_origin_point_drag?(id_point,@connectionsqlite)
	end

	render :text=>"id_point_circle_id-=-=-=-=-=-#{id_point_circle_id}-=-=-=-=-=-=-id_point-=-=-=-=-=-=-#{id_point}=-=-=-=-=-=-=-"
   end

   def set_position_logos_remplacement
	id_point_target = params[:id_point_target].split("~")[0]
	id_point_dragtarget = params[:id_point_target].split("~")[1].split("=")[1]
	sessionfiledb = session["sessionfiledb"]
	filedb = sessionfiledb.filedb	
	@connectionsqlite = ConnectionSqlite.new(filedb)
	tab_detail_link = @connectionsqlite.execute("select * from link where type_1='points' and type_2='blocks' and id_1=#{id_point_dragtarget}")
	block_id = tab_detail_link[0][2]
	
  	@connectionsqlite.update("link", "id_2=#{block_id}", "type_2='blocks' and type_1='points' and id_1=#{id_point_target}")
	@connectionsqlite.delete("link", "id_1=#{id_point_dragtarget} and id_2=#{block_id} and type_2='blocks' and type_1='points'")
	@connectionsqlite.delete("points", "id=#{id_point_dragtarget}") unless Point.verif_origin_point_drag?(id_point_dragtarget,@connectionsqlite)
	render :text=>"id_point_target==-=-=-=-=-=-=-=-#{id_point_target}-=-=-=-=-=-=-=-=-=-=-=-=-==-=-=-id_point_dragtarget=-=-=-=-=-=-=-=-=-=-#{id_point_dragtarget}"
   end

   def suplogos
	sessionfiledb = session["sessionfiledb"]
	filedb = sessionfiledb.filedb
	@connectionsqlite = ConnectionSqlite.new(filedb)
	#connectdatabasesqlite = ConnectionSqlite.new(filedb)

	#connectdatabasesqlite.delete("link", "id_1=#{shapes_id_pour_remplacage} and type_1='shapes'")
	if connectdatabasesqlite.delete("logos", "id=#{params[:id]}")
		@connectionsqlite.delete("logos", "id_2=#{params[:id]} and type_2=logos")
		flash[:notice] = t("controller.notice.fichiercompressions.suplogos.positif")
	else
		flash[:notice] = t("controller.notice.fichiercompressions.suplogos.negatif")
	end
	redirect_to(:back)
   end


   def affichage_svg
	floor_id = params[:floor_id]
	proportion = params[:proportion]
	sessionfiledb = session["sessionfiledb"]	
	filedb = sessionfiledb.filedb
	connectdatabasesqlite = ConnectionSqlite.new(filedb)
	#db = connectdatabasesqlite.db
	tab_info_floor = connectdatabasesqlite.select_total("floors", "id", floor_id)
	position_x = tab_info_floor[0][4]
	position_y = tab_info_floor[0][5]
	points = tab_info_floor[0][11]
	file_bin = tab_info_floor[0][12]	
	
	#render :text=>"nicolas"	
	@affichage_svg = svg_zone(floor_id,position_x,position_y,points,file_bin,proportion)	
	#render :text=>@affichage_svg
  end

  private
	def get_name_id_update_blog(name)
		sessionfiledb = session["sessionfiledb"]
		filedb = sessionfiledb.filedb
		
		connectdatabasesqlite = ConnectionSqlite.new(filedb)
	
			
		tab_translations = connectdatabasesqlite.execute("select * from translations where name LIKE '%#{name}%'")
		unless tab_translations.empty?
			name_id = tab_translations[0][0]
		else
			name_id = connectdatabasesqlite.insert("translations", "'name'","'#{name}'")
		end
		name_id
	end
	
end
