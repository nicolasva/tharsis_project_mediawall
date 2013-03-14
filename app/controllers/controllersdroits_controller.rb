class ControllersdroitsController < ApplicationController 
  before_filter :verifier_acces_admin
  def index
    @controllersdroits = Controllersdroit.all
  end

  def show
    @controllersdroit = Controllersdroit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @controllersdroit }
    end
  end

  def new
   @roles = Role.find :all
   if flash[:controllersdroit].nil?
      @controllersdroit = Controllersdroit.new
   else 
      @controllersdroit = flash[:controllersdroits]
   end
  end

  def edit
   @roles = Role.find :all
   if flash[:controllersdroit].nil?
    @controllersdroit = Controllersdroit.find(params[:id])
   else
    @controllersdroit = flash[:controllersdroit]
   end
  end

  def create
    @controllersdroit = Controllersdroit.new(params[:controllersdroit])

      if @controllersdroit.save
        flash[:notice] = t("controller.notice.controllersdroits.create.positif")
        redirect_to(controllersdroits_url)
      else
	flash[:notice] = t("controller.notice.controllersdroits.create.negatif")
        flash[:controllersdroit] = @controllersdroit
        render :action => "new" 
      end
  end

  def update
    params[:controllersdroit][:role_ids] ||= []
    @controllersdroit = Controllersdroit.find(params[:id])

      if @controllersdroit.update_attributes(params[:controllersdroit])
        flash[:notice] = t("controller.notice.controllersdroits.update.positif") 
        redirect_to(controllersdroits_url)
      else
        flash[:notice] = t("controller.notice.controllersdroits.update.negatif")
	flash[:controllersdroit] = @controllersdroit
        render :action => "edit"
      end
  end

  def destroy
    @controllersdroit = Controllersdroit.find(params[:id])
    @controllersdroit.destroy

      redirect_to(controllersdroits_url)
  end
end
