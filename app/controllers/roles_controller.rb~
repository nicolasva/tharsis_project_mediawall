class RolesController < ApplicationController 
  before_filter :verif_acces_user_controller, :except=>[:new, :create, :show]
  def index
    @roles = flash[:role].nil? ? Role.find(:all, :conditions=>"role_id=1") : flash[:role]
  end

  def show
    @role = Role.find(params[:id])
  end

  def new
   if flash[:role].nil?
    	@role = Role.new
   else
	@role = flash[:role]   
   end
  end

  def edit
    @role = flash[:role].nil? ? Role.find(params[:id]) : flash[:role]
  end

  def create
       if  params[:role][:request_uri].to_s == "addrolessimplifie"
	       array_droit = Array.new
      		tab_acces_right = YAML::load_file("#{RAILS_ROOT}/config/roles_default_right.yml")
		tab_acces_right["roles"]["right"].each { |acces_right|
			Rails.logger.info "-=-=-=-=-=-=--=-=-=-#{acces_right}-=-=-=-=-=-=-=-=-=-=-"
			controllerdroit = Controllersdroit.find_by_name(acces_right)
				array_droit.push(controllerdroit.id) unless controllerdroit.nil?
		}
		params[:role][:controllersdroit_ids] = array_droit
		params[:role][:role_id] = current_user.role_id
	end

      @role = Role.new(params[:role])
      if @role.save
	passwordrand = (Array.new(YAML::load_file("#{RAILS_ROOT}/config/randomlengthpassword.yml")["length"].to_i/2) { rand(256) }.pack('C*').unpack('H*').first).to_s
	name_user = @role.name.downcase.gsub(" ","_")
	unless User.find(:first, :conditions=>{:username=>name_user}).nil?
		compteur = 0
		while (User.find(:first, :conditions=>{:username=>"#{name_user}#{compteur}"}).nil? == false)
			compteur += 1
		end

		name_user = "#{name_user}#{compteur}"
		Rails.logger.info "compteur_test #{compteur}-=-=-=-=-"
	end
	user = User.new(:username=>name_user, :password=>passwordrand.to_s, :password_confirmation=>passwordrand.to_s, :role_id=>@role.id, :email=>"#{name_user}@default.com", :language=>"fr", :alertapp=>0) 
       	user.save
	mail = Mailnotifrole.create_mails(@role,current_user,user,passwordrand)
       	mail.set_content_type "text/html"
       	Mailnotifrole.deliver mail
	#user.create_ftp_compte(@role.name)
	#if user.save
	#	flash[:notice] = "Utilisateur crée"
	#else
	#	flash[:notice] = "Utilisateur non crée"
	#end
	#dsfdsfsdfsfsdf
	flash[:notice] = t("controller.notice.roles.create.positif")
        flash[:password] = passwordrand	
       if control_acces_user_controller("roles","new")
	        flash[:role] = @role
		redirect_to(roles_url)
	else
		redirect_to @role
	end
      else
	flash[:notice] = t("controller.notice.roles.create.negatif")
	flash[:role] = @role
        render :action => "new"
      end
  end

  def update
    params[:role][:groupapp_ids] ||= []
    params[:role][:controllersdroit_ids] ||= []
    @role = Role.find(params[:id])

      if @role.update_attributes(params[:role])
        flash[:notice] = t("controller.notice.roles.update.positif")
        redirect_to(roles_url)
      else
        flash[:notice] = t("controller.notice.roles.update.negatif")
 	flash[:role] = @role
        render :action => "edit"
      end
  end

  def destroy
    @role = Role.find(params[:id])
    @role.destroy

      redirect_to(roles_url)
  end
end
