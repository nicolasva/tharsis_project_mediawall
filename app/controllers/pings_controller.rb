class GestionTimePing
  	CONF_PATH = "#{RAILS_ROOT}/config/ping_time.yml"
	def initialize(application_id)
		@application_id = application_id
		@time_now = Time.now
    		@configuration = YAML::load_file(CONF_PATH)
	end

	def supression_ping
		tab_liste_ping = Ping.find :all, :conditions=>"application_id=#{@application_id}"
		tab_liste_ping.each{ |liste_ping|
			calcul_ping(liste_ping.created_at) ? Ping.delete(liste_ping.id) : ""
		}
	end

	private
	def calcul_ping(time_ping)
		time_difference_sec = ( time_ping > @time_now ? time_ping - @time_now : @time_now - time_ping )
		time_minute = time_difference_sec / 60
		time_heure = time_minute / 60
		time_jour = time_heure / 24
		time_jour_conf = @configuration["delete"]
		time_jour.round > time_jour_conf ? true : false
	end
end

class PingsController < ApplicationController
  def index
    @pings = Ping.all
  end

  def show
    #GestionTimePing.new(params[:id]).supression_ping
    Ping.destroy_all("created_at < '#{(Time.now - (86400 * 5)).strftime("%Y-%m-%d %H:%M:%S")}'")
    ping = Ping.find(params[:id])
    application = ping.application
    #application = Application.find(params[:id]).paginate(:per_page => ByPage.new("pings").page, :page => params[:page])
    @pings = application.pings.paginate(:per_page=> ByPage.new("pings").page, :page => params[:page], :order=>"created_at desc")
  end

  def new
   if flash[:ping].nil?
    	   @ping = Ping.new
   else
	   @ping = flash[:ping]
   end

  end

  def edit
    @ping = Ping.find(params[:id])
  end

  def create 
   @user_session = UserSession.new(params[:users])
	
   if @user_session.save
    application = Application.find :first, :conditions=>"serial=#{params[:ping][:application_id]}"
    params[:ping][:application_id] = application.id
    @ping = Ping.new(params[:ping])

      if @ping.save
	flash[:notice] = t("controller.notice.pings.create.positif") 
        #redirect_to :controller=>"pings", :action=>"show", :id=>@ping.application_id
          render :text=>application.serial 
     else
	flash[:notice] = t("controller.notice.pings.create.negatif")
	flash[:ping] = @ping
        render :text=>"0"
      end
    else
	render :text=>"0"
    end
  end

  # PUT /pings/1
  # PUT /pings/1.xml
  def update
    @ping = Ping.find(params[:id])

    respond_to do |format|
      if @ping.update_attributes(params[:ping])
        flash[:notice] = 'Ping was successfully updated.'
        format.html { redirect_to(@ping) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ping.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pings/1
  # DELETE /pings/1.xml
  def destroy
    @ping = Ping.find(params[:id])
    @ping.destroy
    redirect_to(:back)
  end
end
