class GroupappsController < ApplicationController
  # GET /groupapps
  # GET /groupapps.xml
  def index
    @groupapps = Groupapp.find(:all)
  end

  # GET /groupapps/1
  # GET /groupapps/1.xml
  def show
    @groupapp = Groupapp.find(params[:id])
  end

  # GET /groupapps/new
  # GET /groupapps/new.xml
  def new
	@roles = Role.find(:all)
   	if flash[:groupapp].nil?
    		@groupapp = Groupapp.new
	else
		@groupapp = flash[:groupapp]
	end
  end

  # GET /groupapps/1/edit
  def edit
    @roles = Role.find(:all)
    @groupapp = Groupapp.find(params[:id])
  end

  # POST /groupapps
  # POST /groupapps.xml
  def create
    @groupapp = Groupapp.new(params[:groupapp])

    #respond_to do |format|
      if @groupapp.save
        #format.html { redirect_to(@groupapp, :notice => 'Groupapp was successfully created.') }
        #format.xml  { render :xml => @groupapp, :status => :created, :location => @groupapp }
      	flash[:notice] = "La création de ce groupe d'applications s'est bien déroulé il est désormais disponible"
      	redirect_to groupapps_path
      else
        #format.html { render :action => "new" }
        #format.xml  { render :xml => @groupapp.errors, :status => :unprocessable_entity }
	flash[:groupapp] = @groupapp
	flash[:notice] = "La supression de ce groupe d'applications ne s'est pas déroulé correctement elle n'est pas diponible"
	render :action => "new"
      end
  end

  # PUT /groupapps/1
  # PUT /groupapps/1.xml
  def update
    params[:groupapp][:role_ids] ||= []
    @groupapp = Groupapp.find(params[:id])

    #respond_to do |format|
      if @groupapp.update_attributes(params[:groupapp])
        #format.html { redirect_to(@groupapp, :notice => 'Groupapp was successfully updated.') }
        #format.xml  { head :ok }
	flash[:notice] = "La mise à jour de ce groupe d'applications s'est bien déroulé il est désormais disponible"
	redirect_to groupapps_path	
      else
	flash[:notice] = "La mise à jour de ce groupe d'applications ne s'est pas déroulé correctement il n'est pas disponible"
	flash[:groupapp] = @groupapp
	redirect_to(:back)
        #format.html { render :action => "edit" }
        #format.xml  { render :xml => @groupapp.errors, :status => :unprocessable_entity }
      end
    #end
  end

  # DELETE /groupapps/1
  # DELETE /groupapps/1.xml
  def destroy
    @groupapp = Groupapp.find(params[:id])
    if @groupapp.destroy
	@groupapp.roles.destroy_all
	flash[:notice] = "La supression de ce groupe d'applications s'est bien déroulé il n'est plus disponible"
    else
	flash[:notice] = "La supression de ce groupe d'applications ne s'est pas déroulé correctement il n'est pas disponible"
    end
	redirect_to(:back)	
  end
end
