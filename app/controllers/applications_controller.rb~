class ApplicationsController < ApplicationController
  before_filter :verif_acces_user_controller, :except=>[:valid_edit_etat, :valid_edit_client, :valid_edit_etat, :edit_etat, :get_sha, :get_statpaiement, :get_command, :set_command, :set_old_serial_apps, :get_remotename, :set_remotename, :get_all_apps_fichiercompressions, :getappgroup]   
  	before_filter :verifier_acces, :except=>[:valid_edit_client, :valid_edit_etat, :edit_etat, :get_sha, :get_statpaiement, :get_command, :set_command, :set_old_serial_apps, :get_remotename, :set_remotename, :get_all_apps_fichiercompressions, :getappgroup]
  
  def index 
        unless params[:id].nil?
		per_page = Application.count
        else
		per_page = ByPage.new("application").page
        end
	
     @application_search = Application.new
	    unless params[:role_id].nil?
	    		@applications = Application.paginate(:per_page => per_page, :page => params[:page], :include=>[:pings, :groupapp, {:avoirs => :fichiercompression}], :conditions=>{:role_id=>get_parent_home_applications(params[:role_id]) == 0 ? params[:role_id].to_i.to_a : get_array_parent_home_applications(params[:role_id].to_s + get_parent_home_applications(params[:role_id]))}, :order=>"#{params[:detetime].nil? ? "" : "updated_at #{params[:datetime]},"}#{params[:arrow].nil? ? "" : "pings.created_at #{params[:arrow]},"}#{params[:applicationname].nil? ? "" : "name #{params[:applicationname]},"}#{params[:groupapps].nil? ? "" : "groupapps.name #{params[:groupapps]},"}#{params[:contenu].nil? ? "" : "fichiercompressions.description #{params[:contenu]},"}#{params[:mac].nil? ? "" : "mac #{params[:mac]},"}#{params[:updated_at].nil? ? "" : "updated_at #{params[:updated_at]},"}#{params[:statpaiement].nil? ? "" : "statpaiement #{params[:statpaiement]},"}position", :group=>"applications.id")
	    else
		    	@applications = Application.paginate(:per_page => per_page, :page => params[:page], :include=>[:pings, :groupapp, {:avoirs => :fichiercompression}], :conditions=>{:role_id=>get_parent_home_applications(current_user.role_id) == 0 ? current_user.role_id.to_i.to_a : get_array_parent_home_applications(current_user.role_id.to_s + get_parent_home_applications(current_user.role_id))} ,:order=>"#{params[:detetime].nil? ? "" : "updated_at #{params[:datetime]},"}#{params[:arrow].nil? ? "" : "pings.created_at #{params[:arrow]},"}#{params[:applicationname].nil? ? "" : "name #{params[:applicationname]},"}#{params[:groupapps].nil? ? "" : "groupapps.name #{params[:groupapps]},"}#{params[:contenu].nil? ? "" : "fichiercompressions.description #{params[:contenu]},"}#{params[:mac].nil? ? "" : "mac #{params[:mac]},"}#{params[:updated_at].nil? ? "" : "updated_at #{params[:updated_at]},"}#{params[:statpaiement].nil? ? "" : "statpaiement #{params[:statpaiement]},"}position", :group=>"applications.id")
	    end
      		@role = Role.find(current_user.role_id) 
  end

  def statpaiement
 	application = Application.find(params[:id])
	if application.update_attributes(:statpaiement=>params[:statpaiement].to_i == 0 ? 1 : 0)
       		mail = Mailactivationlicence.create_mails(application,current_user)
       		mail.set_content_type "text/html"
       		Mailactivationlicence.deliver mail
		flash[:notice] = t("controller.notice.application.statpaiement.positif") 
	else
		flash[:notice] = t("controller.notice.application.statpaiement.negatif")
	end
	
	redirect_to(:back)	
  end

  def show
	  #render :text=>params[:search_borne][:contenu_search]
    #@application = Application.find :first, :conditions=>"serial='#{params[:application_search][:serial]}'"
	  #@application = Application.find(:first, :conditions=>{:name=>params[:search_borne][:contenu_search]})
  	@application = Application.find(:first, :conditions=>"name='#{params[:search_borne][:contenu_search].to_s.strip}'")
  end

  def new  
   if flash[:application].nil?
    @application = Application.new
   else
    @application = flash[:application]
    @application_recap = flash[:applicationrecap] unless flash[:applicationrecap].nil?
   end
  end

  def edit
    if flash[:application].nil?
    	@application = Application.find(params[:id])
    else
	@application = flash[:application]
    end
  end

  def edit_client
	  if flash[:application_client].nil?
	  	@application_client = Application.new
	  else
		@application_client = flash[:application_client]
	  end
  end

  def valid_edit_client
    @user_session = UserSession.new(params[:users])
   if @user_session.save
    if Application.exists?(:serial=>params[:application_client][:serial]) 
		@application_client = Application.find :first, :conditions=>"serial=#{params[:application_client][:serial]}"
	   if (@application_client.mac.nil? || @application_client.mac == params[:application_client][:mac]) && @application_client.activate
		params[:application_client][:ville] = IpGeocoder.geocode(request.remote_ip).city.nil? ? t("controller.notice.applications.valid_edit_client.ville_name") : IpGeocoder.geocode(request.remote_ip).city
		#geolocalisation = Geolocalistion.new(request.remote_ip)
		#params[:application_client][:ville] = city(request.remote_ip)
		if @application_client.update_attributes(params[:application_client])
			@etat_application = Application.find(@application_client.id)
			Rails.logger.info t("controller.notice.applications.valid_edit_client.positif") 
			#flash[:notice] = t("controller.notice.applications.valid_edit_client.positif")
			render :text=>@application_client.serial		
		else
			Rails.logger.info t("controller.notice.applications.valid_edit_client.negatif")
			#flash[:notice] = t("controller.notice.applications.valid_edit_client.negatif")
			flash[:application_client] = @application_client	
			render :text=>"0"
		end
	    else
			render :text=>"0"	
	    end
       else
		Rails.logger.info t("controller.notice.applications.valid_edit_client.absence_serial") 
		#flash[:notice] = t("controller.notice.applications.valid_edit_client.absence_serial")
			render :text=>"0"
       end
     else
		render :text=>"0"
     end
  end

  def get_all_apps_fichiercompressions
  	require 'rexml/document'
	#include REXML
	#get_array_parent_home_applications(params[:role_id].to_s + get_parent_home_applications(params[:role_id]))
	@user_session = UserSession.new(params[:users])
	if @user_session.save
		user = User.find(:first, :conditions=>{:username=>params[:users][:username]})
 		#applications = Application.find(:all, :joins=>[:groupapp], :conditions=>{:role_id=>get_parent_home_applications(user.role_id) != 0 ? get_array_parent_home_applications(user.role_id.to_s + get_parent_home_applications(user.role_id)) : get_array_parent_home_applications(user.role_id.to_s) , :groupapps=>{:name=>params[:groupapps][:name]}})	
 		applications = Application.find(:all, :conditions=>{:role_id=>get_parent_home_applications(user.role_id) != 0 ? get_array_parent_home_applications(user.role_id.to_s + get_parent_home_applications(user.role_id)) : get_array_parent_home_applications(user.role_id.to_s)})
		xmlallversionapps = REXML::Document.new
		xmlallversionapps.add_element("users", {"id"=>user.role_id})
		xmlallversionapps.root.add_element("applications")
		applicationsxml = xmlallversionapps.root.elements[1]
		#applications = Application.all
		applications.each { |application|
			#applicationsxml = xmlallversionapps.root.elements[1]
			#Rails.logger.info application.name
			#applicationsxml.elements << REXML::Element.new("name")
			#applicationsxml.elements["name"].text = application.name.to_s
			#applicationsxml.elements << REXML::Element.new("serial")
			#applicationsxml.elements["serial"].text = application.serial.to_s
			#applicationsxml.elements << REXML::Element.new("mac")
			#applicationsxml.elements["mac"].text = application.mac.to_s
			#applicationsxml.elements << REXML::Element.new("ville")
			#applicationsxml.elements["ville"].text = application.ville.to_s
			applicationxml = REXML::Element.new("application")
		        applicationxml.add_element("id")
			applicationxml.elements["id"].text = application.id	
			applicationxml.add_element("name")
			applicationxml.elements["name"].text = application.name.strip.to_s
			applicationxml.add_element("serial")
			applicationxml.elements["serial"].text = application.serial
			applicationxml.add_element("currentversion")
			applicationxml.elements["currentversion"].text = application.avoirs.find(:first, :conditions=>{:currentversion=>1}).nil? ? "Pas de version courante pour cette borne" : application.avoirs.find(:first, :conditions=>{:currentversion=>1}).fichiercompression_id
				application.avoirs.each{ |avoir|
					versionfichiercompressionidxml = REXML::Element.new("versionzip")
					versionfichiercompressionidxml.add_element("versionid")
					versionfichiercompressionidxml.elements["versionid"].text = avoir.fichiercompression_id
					versionfichiercompressionidxml.add_element("description")
					versionfichiercompressionidxml.elements["description"].text = avoir.fichiercompression.description.strip.to_s
					versionfichiercompressionidxml.add_element("file_name")
					versionfichiercompressionidxml.elements["file_name"].text = avoir.fichiercompression.file_file_name.strip.to_s
					applicationxml.elements << versionfichiercompressionidxml
				}
			applicationsxml.elements << applicationxml

		}

			#Rails.logger.info applicationsxml
			#render :text=>xmlallversionapps
			#File.open("#{RAILS_ROOT}/public/versionxml/allappsversionfiles/listapplications.xml", "w+") do |f|
			#	f.write xmlallversionapps
			#end

			render :text=>xmlallversionapps
	else
		render :text=>0
	end
  end

  def edit_etat
	  if flash[:edit_etat_application].nil?
	  	@application_edit_etat = Application.new
	  else
		@application_edit_etat = flash[:application_client]
	  end
  end

  def valid_edit_etat
     if Application.exists?(:serial=>params[:edit_etat_application][:serial])
	params[:edit_etat_application][:ville] = IpGeocoder.geocode(request.remote_ip).city.nil? ? t('controller.notice.applications.ville_name') : IpGeocoder.geocode(request.remote_ip).city
 	@etat_application = Application.find :first, :conditions=>"serial=#{params[:edit_etat_application][:serial]}"	

	if @etat_application.update_attributes(params[:edit_etat_application])
		flash[:notice] = t("controller.notice.applications.valid_edit_etat.positif") 
		#redirect_to applications_url
		render :nothing=>true, :status=>200
	else
		flash[:edit_etat_application] = @etat_application
		flash[:notice] = t("controller.notice.applications.valid_edit_etat.negatif") 
		#redirect_to(:back)
		render :nothing=>false, :status=>404
	end
      else
		render :nothing=>false, :status=>404
      end
  end

  def get_sha
	@user_session = UserSession.new(params[:users])

	if @user_session.save
		application = Application.find :first, :conditions=>"serial='#{params[:application_client][:serial]}' and mac='#{params[:application_client][:mac]}'"
		unless application.nil?
			require 'digest/sha2'
			render :text => Digest::SHA2.hexdigest("#{params[:application_client][:serial]}_THARSIS_#{application.mac}")
		else
			render :text => 0
		end
	else
		render :text => 0
	end
  end

  def get_command
 	@user_session = UserSession.new(params[:users])

	if @user_session.save
		application = Application.find(:first, :conditions=>"serial='#{params[:application_client][:serial]}'")
		render :text=>application.reboot
	else
		render :text => 0
	end	
  end

  def get_statpaiement
  	@user_session = UserSession.new(params[:users])

	if @user_session.save
		application = Application.find(:first, :conditions=>"serial='#{params[:application_client][:serial]}'")
		render :text=>application.statpaiement
	else
		render :text => 0
	end
  end

  def set_command
  	@user_session = UserSession.new(params[:users])
	if @user_session.save
		application = Application.find(:first, :conditions=>"serial='#{params[:application_client][:serial]}'")
		if application.update_attributes(:reboot=>0)
			render :text=>1
		else
			render :text=>0
		end
	else
		render :text=>0
	end
  end

  def set_remotename
  	@user_session = UserSession.new(params[:users])

	if @user_session.save
		application = Application.find(:first, :conditions=>"serial='#{params[:application_client][:serial]}'")
		if application.update_attributes(:remotename=>params[:application_client][:remotename], :remotevalue=>params[:application_client][:remotevalue])
			render :text=>1
		else
			render :text=>0
		end
	else
		render :text=>0
	end
  end

  def get_remotename
  	@user_session = UserSession.new(params[:users])

	if @user_session.save
		application = Application.find(:first, :conditions=>"serial='#{params[:application_client][:serial]}' and remotename='#{params[:application_client][:remotename]}'")
		render :text=>application.remotevalue
	else
		render :text=>0
	end
  end

  def set_old_serial_apps
	  @user_session = UserSession.new(params[:users])
	  if @user_session.save
	  	application = Application.find(:first, :conditions=>"serial='#{params[:application_client][:serial]}'")
		if application.update_attributes(:old_serial=>params[:application_client][:old_serial])
			render :text => 1
		else
			render :text => 0
		end
	  else
		  render :text => 0
	  end
  end

  def create
    #Define default license
    groupapp_id = params[:application][:groupapp_id]
    role_id = params[:application][:role_id]
    application = Application.find(:first, :conditions=>"role_id=#{role_id} and groupapp_id=#{groupapp_id}")
    #unless application.nil?
    #	avoir = application.avoirs.find(:first, :conditions=>"currentversion=1")
    #	fichiercompression_id = avoir.fichiercompression_id unless avoir.nil?
    #end

    params[:application][:serial] = rand(999999) 
    @application = Application.new(params[:application])

     #unless @application.base_version?
      if @application.save
       @application.last_version_mediawall
       mail = Mailnewlicence.create_mails(@application,current_user)
       mail.set_content_type "text/html"
       Mailnewlicence.deliver mail
       #unless application.nil? 
       #	unless avoir.nil?
	#	avoir = Avoir.new(:fichiercompression_id=>fichiercompression_id, :application_id=>@application.id, :currentversion=>1)
	#	avoir.save
	#end
       #end
        flash[:notice] = t("controller.notice.applications.create.positif") 
        #redirect_to(applications_url) 
	flash[:applicationrecap] = @application	
      else
        flash[:notice] = t("controller.notice.applications.create.negatif")
	#flash[:application] = @application	
      end	
     #else
     #	 flash[:notice] = t("controller.notice.applications.create.negatif_no_base_version") 
     #end
	flash[:application] = @application	
	redirect_to :controller=>"applications", :action=>"new"
  end

  def getappgroup
	@user_session = UserSession.new(params[:users])
	if @user_session.save
 		application = Application.find(:first, :conditions=>{:serial=>params[:applications][:serial]})

		unless application.nil?
			render :text=>application.groupapp.name
		else
			render :text=>0
		end
	else
		render :text => 0
	end
  end

  def apps_sharing_zips
	@zips = Fichiercompression.find(params[:id])
  end

  def nb_applications_generate
	  1.upto(params[:application][:nombre_application].to_i){ |i|
	  	@application = Application.new(:name=>"application#{rand(9)}" , :serial=>rand(999999), :groupapp_id=>params[:application][:groupapp_id])
	  	@application.save
	  }
	  redirect_to(applications_url)
  end

  def update
    #params[:application][:role_ids] ||= []
    @application = Application.find(params[:id])

      if @application.update_attributes(params[:application])
        flash[:notice] = t("controller.notice.applications.update.positif")
        redirect_to(:controller=>"applications", :action=>"index", :role_id=>@application.role_id)
	#redirect_to :action=>
      else
 	flash[:notice] = t("controller.notice.applications.update.negatif")
	flash[:application] = @application
        #render :action => "edit"
	redirect_to(:back)
      end
  end

  def edit_select
       unless params[:choix_edit_application].nil? && params[:activation_apps].nil? && params[:desactive_apps].nil?
	  compteur_verif = 0
	  @tab_application = params[:choix_edit_application][:application_id]
          unless params[:sup_ensemble_applications].nil?
		0.upto(@tab_application.length-1){ |i|
			application = Application.find(@tab_application[i])
			if application.destroy
				compteur_verif += 1
			end
		}
		if compteur_verif == @tab_application.length
			flash[:notice] = t("controller.notice.applications.edit_select.delete_apps_positif") 
		else
			flash[:notice] = t("controller.notice.applications.edit_select.delete_apps_negatif")
		end
	  end

	  unless params[:activation_apps].nil?
	  	0.upto(@tab_application.length-1){ |i|
			application = Application.find(@tab_application[i])
			if application.update_attributes(:activate=>1)
				compteur_verif += 1
			end
		}
		if compteur_verif == @tab_application.length
			flash[:notice] = t("controller.notice.applications.edit_select.activation_apps_positif")
		else
			flash[:notice] = t("controller.notice.applications.edit_select.activation_apps_negatif")
		end
	  end

	  unless params[:desactive_apps].nil?
	  	0.upto(@tab_application.length-1){ |i|
			application = Application.find(@tab_application[i])
			if application.update_attributes(:activate=>0)
				compteur_verif += 1
			end
		}

		if compteur_verif == @tab_application.length
			flash[:notice] = t("controller.notice.applications.edit_select.desactivation_apps_positif") 
		else
			flash[:notice] = t("controller.notice.applications.edit_select.desactivation_apps_negatif")
		end
	  end

	  unless params[:reboot_apps].nil?
	  	0.upto(@tab_application.length-1){ |i|
			application = Application.find(@tab_application[i])
			if application.update_attributes(:reboot=>"reboot")
				compteur_verif += 1
			end
		}

		if compteur_verif == @tab_application.length
			flash[:notice] = t("controller.notice.applications.edit_select.reboot_apps_positif")
		else
			flash[:notice] = t("controller.notice.applications.edit_select.reboot_apps_negatif")
		end
	  end

	  unless params[:remote_assistance].nil?
	  	0.upto(@tab_application.length-1){ |i|
			application = Application.find(@tab_application[i])
			if application.update_attributes(:reboot=>"remoteassistance")
				compteur_verif += 1
			end
		}

		if compteur_verif == @tab_application.length
			flash[:notice] = t("controller.notice.applications.edit_select.remote_assistance_positif") 
		else
			flash[:notice] = t("controller.notice.applications.edit_select.remote_assistance_negatif") 
		end
	  end
	else
		flash[:notice] = t("controller.notice.applications.edit_select.selection_app")
	end 
		redirect_to(:back)
  end

  def valid_attribution_role
	  tab_liste_applications = params[:attribution_roles][:application_id]

	  0.upto(tab_liste_applications.length-1){ |i|
	  	application = Application.find(tab_liste_applications[i])
		application.update_attributes(:role_ids=>params[:attribution_roles][:role_ids])
	  }

	  redirect_to applications_url
  end

  def valid_all_edit
	  application = Application.find(:all)
	  
	  application.each{ |liste_application|
	  	application_update = Application.find(liste_application.id)
		application_update.update_attributes(:role_ids=>params[:application][:role_ids])
	  }
	  redirect_to(:back)
  end

  def sort
	params[:applications].each_with_index do |id, index|
		Application.update_all(['position=?', index+1], ['id=?', id])
		end
	render :nothing => true
  end

  def search_auto_completion
	@application = Application.find(:all, :conditions =>"serial LIKE '%#{params[:search]}%' or name LIKE '%#{params[:search]}%'")
  end

  def edit_all
	  @val = 0
	  @application = Application.find :all
  end

  def editapplicationszips
    tab_applications = params[:applicationzips][:application_id]
    compteur = 0
   unless tab_applications.empty?
	Avoir.update_all("currentversion=0", "fichiercompression_id=#{params[:applicationzips][:zip_id]}")
      unless tab_applications.nil?
	0.upto(tab_applications.length-1){ |i|
		Avoir.update_all("currentversion=0", "application_id=#{tab_applications[i]}")
		@avoir = Avoir.find :first, :conditions=>"fichiercompression_id=#{params[:applicationzips][:zip_id]} and application_id=#{tab_applications[i]}"
		if @avoir.update_attributes(:currentversion=>1)
			compteur += 1
		end
	}
      end
      	if compteur == tab_applications.length
		flash[:notice] = "Le fichier courant à bien été définis pour ces applications"
	else
		flash[:notice] = "Le fichier courant n'a pas été correctement pour ces applications"
	end	
   else
	flash[:notice] = "Veuillez séléctionner des applications"
   end

	redirect_to(:back)
  end

  def destroy_zip
    @application = Application.find(params[:id])
    @application.avoirs.destroy_all
    redirect_to(:back)
  end

  def destroy
    @application = Application.find(params[:id])
    @application.destroy
    @application.roles.destroy_all
    @application.avoirs.destroy_all

      redirect_to(applications_url)
  end

  private
  def get_array_parent_home_applications(string_get_parent_home)
	  #tab_string = Array.new
	  tab_array_parent_home_applications = Array.new
	  #tab_string = string_get_parent_home.split("-")
	  string_get_parent_home.split("-").each{ |value_get_parent_home|
	  	tab_array_parent_home_applications.push(value_get_parent_home.to_i)
	  }
	  tab_array_parent_home_applications
	  
	  #0.upto(tab_string.length-1){ |i|
	  #	tab_array_parent_home_applications.push(tab_string[i])
	  #}

	  #tab_array_parent_home_applications
	  #get_array_parent_home_applications(user_role_id)
	  
	  #value_role_id_all = "#{user_role_id.to_s}#{get_array_parent_home_applications(user_role_id)}"
  end

  def get_parent_home_applications(user_role_id)	
	#get_parent_home_applications(params[:role_id]) == 0 ? params[:role_id].to_i.to_a : get_array_parent_home_applications(params[:role_id].to_s + get_parent_home_applications(params[:role_id]))
	#while user_role_id != params_role_id do 
	#	role = Role.find(params_role_id)
	#	tab_role.push(role.role_id)
	#	params_role_id = role.role_id
	#end
      
	roles = Role.find(:all, :conditions=>"role_id=#{user_role_id}")
      unless roles.empty?
	      tab_roles = ""
	roles.each{ |role|
		tab_roles += "-#{role.id}" 

		unless get_parent_home_applications(role.id) == 0
			tab_roles += "#{get_parent_home_applications(role.id)}"
		end		
	}
	tab_roles
      else 
	      0
      end
  end
end
