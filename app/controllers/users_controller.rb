class UsersController < ApplicationController 
  before_filter :verifier_acces
  before_filter :verif_acces_user_controller, :except=>[:edit, :update] 
  def index
    #@users = User.find :all
    @users = User.paginate(:per_page => ByPage.new("users").page, :page => params[:page], :conditions=>{:role_id=>get_array_parent_home_applications(current_user.role_id.to_s + get_parent_home_applications(current_user.role_id))})
  end

  def show
    @users = User.paginate(:per_page => ByPage.new("users").page, :page => params[:page], :conditions=>"role_id=#{params[:id]}")
  end

  def new
    if flash[:user].nil?
    	@user = User.new
    else
    	@user = flash[:user]
    end
  end

  def edit
   if flash[:user].nil?
    	@user = User.find(params[:id])
   else
	@user = flash[:user]
   end
  end

  def create
    @user = User.new(params[:user])

      if @user.save
       	mail = Mailusernotifuser.create_mails(@user, params[:user][:password],current_user)
       	mail.set_content_type "text/html"
       	Mailusernotifuser.deliver mail
	#@user.create_ftp_compte(params[:user][:password])
        flash[:notice] = t("controller.notice.users.create.positif")
	redirect_to :action=>"index"
      else
        flash[:notice] = t("controller.notice.users.create.negatif")
	flash[:user] = @user
	redirect_to :action=>"new"
      end
  end

  def update
    params[:user][:application_ids] ||= [] 
    params[:user][:backgroundcolor] = "none" if params[:removebackgroundcolor]
    params[:user][:colortext] = "none" if params[:removecolortext]
    @user = User.find(params[:id])

      if @user.update_attributes(params[:user])
        flash[:notice] = t("controller.notice.users.update.positif") 
	if current_user.id == @user.id
		langue = Langue.new
		langue.langue = @user.language
		session['langue'] = langue
	end
        #if current_user.role_id == 1
        #	redirect_to :action=>"index"
	#else
	#end
      else
	flash[:notice] = t("controller.notice.users.update.negatif")
	flash[:user] = @user
      end
		redirect_to(:back)
  end

  def valid_search_user
	@user = User.find :first, :conditions => "username='#{params[:user][:username]}'"
	
	if @user.nil?
		flash[:notice] = "Cette utilisateur n'existe pas"
		redirect_to(:back)
	else
		redirect_to :controller=>"users", :action=>"edit", :id=>@user.id
	end
  end

  def search_user_auto_completion
	@user = User.find(:all, :conditions => "username LIKE '%#{params[:search]}%'")	
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to(users_url)
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
