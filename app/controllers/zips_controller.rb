class ZipsController < ApplicationController
  before_filter :verif_acces_user_controller
  def index
    @zips = Zip.paginate(:per_page => 10, :page => params[:page])
  end

  def show
    #@zip = Zip.find(params[:id])
    if params[:id] = "getcurrentversion"
	    zip = Zip.find :first, :conditions=>"currentversion=1"
	     render :text=>zip.id
    end
  end

  def getversion
	  @zip = Zip.find(params[:version])
	  render :text=>"<body onload=\"document.location.href='#{@zip.file.url}'\"></body>"
  end

  def new
   if flash[:zip].nil?
    	   @zip = Zip.new
   else
	   @zip = flash[:zip]
   end
  end

  def edit
   if flash[:zip].nil?
    	@zip = Zip.find(params[:id])
   else
	@zip = flash[:zip]
   end
  end

  def create
    @zip = Zip.new(params[:zip])

      if @zip.save
        flash[:notice] = 'Ce fichier a correctement été uploadé'
        #redirect_to(zips_url)
        redirect_to(zips_url)
      else
	flash[:zip] = @zip
        render :action => "new"
      end
  end

  def update
    @zip = Zip.find(params[:id])

      if @zip.update_attributes(params[:zip])
        flash[:notice] = 'Ce fichier a correctement été mis à jour.'
        redirect_to(zips_url)
      else
	flash[:zip] = @zip
        render :action => "edit"
      end
  end

  def destroy
    @zip = Zip.find(params[:id])
    @zip.destroy

      redirect_to(zips_url)
  end

  def validate_version_actuelle
	Zip.update_all("currentversion=0")
	Zip.update(params[:zips_version][:currentversion], :currentversion=>1)

	redirect_to(:back)
  end
end
