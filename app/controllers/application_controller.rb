# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ByPage
	CONF_PATH = "#{RAILS_ROOT}/config/conf_page.yml"
	def initialize(controller)
                @controller = controller
		@chargementpage = YAML::load_file(CONF_PATH)	
	end

	def page
		@chargementpage[@controller]
	end
end

class Langue
	attr_accessor :langue
end

class SessionFileDB
	attr_accessor :filedb
end

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  helper_method :current_user
  before_filter :set_user_language

  [:notice, :error].each do |flash_type|
    define_method("flash_#{flash_type}") do |text|
      _flash(flash_type, text)
    end

    define_method("t_flash_#{flash_type}") do |*args|
      _flash(flash_type, t(*args))
    end

    define_method("auto_flash_#{flash_type}") do |*args|
      auto_flash(flash_type, *args)
    end
  end

  def auto_flash(status, interpolation_hash = {}, options = {})
    action = options.delete(:action) || action_name.to_s + (action_name.to_s[-1,1] == 'e' ? "d" : "ed")
    model_class = options.delete(:object) || controller_name.to_s
    notice_text = t("flashs.#{model_class.singularize}.#{action}#{"_failed" if status.to_sym == :error}", interpolation_hash)
    _flash(status.to_sym, notice_text)
  end

  def magic_flash(status, interpolation_hash = {}, options = {})
    send("auto_flash_#{status == true ? 'notice' : 'error'}".to_sym, interpolation_hash, options)
    return status
  end

  def verifier_acces_admin
	if current_user
		unless current_user.role_id == 1
			flash[:notice] = t("controller.notice.application.verifier_acces_admin") 
			redirect_to edit_user_path(current_user.id)  
		end
        else	
	   flash[:notice] = t("controller.notice.application.not_acces")
  	   redirect_to login_path
	end
  end
 
  def verifier_acces
        unless current_user
	   flash[:notice] = t("controller.notice.application.not_acces")
  	   redirect_to login_path
        end
  end

  def verif_acces_controller_page(controller_name,actioname)
	 verif_acces_controller_page =  Controllersdroit.find(:first, :joins=>[:roles], :conditions=>"controllersdroits.name='#{controller_name}/#{actioname}' and roles.id=#{current_user.role_id.to_i}")
 		Rails.logger.info "-=-=-=-=--=-=-#{verif_acces_controller_page.nil? ? true : false}-=-=-=-=-"
		verif_acces_controller_page.nil? ? true : false
  end

  def verif_acces_user_controller
	if current_user
		unless control_acces_user_controller(controller_name,action_name)
			flash[:notice] = t("controller.notice.application.verifier_acces_admin") 
			redirect_to edit_user_path(current_user.id)
		else
			if verif_acces_controller_page(controller_name,action_name) == false
				redirect_to edit_user_path(current_user.id)
			end
		end
	else
	   flash[:notice] = t("controller.notice.application.not_acces")
  	   redirect_to login_path
	end
  end

  def control_acces_user_controller(controllername,actioname)
	verif_droit_controller = Controllersdroit.find :first, :joins=>[:roles], :conditions=>"controllersdroits.name='#{controllername.to_s}' and controllersdroits.name<>'#{controllername.to_s}/#{actioname.to_s}' and roles.id=#{current_user.role_id.to_i}"
	unless verif_droit_controller.nil?
		verif_acces_controller_page(controllername,actioname)		
	else
		false
	end
	#verif_droit_controller.nil? ? false : true
  end

  private
  def _flash(status, text)
    flash[status] = text.to_s
  end

  def current_user_session
        return @current_user_session if defined?(@current_user_session)
        @current_user_session = UserSession.find
  end

  def current_user
        return @current_user if defined?(@current_user)
        @current_user = current_user_session && current_user_session.record
  end

  def set_user_language
                      unless session['langue'].nil?
			p = session['langue']
  			I18n.locale = p.langue
                      else
				I18n.locale = current_user.language if current_user
		      end
  end
end
