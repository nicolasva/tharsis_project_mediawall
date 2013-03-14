class AvoirsController < ApplicationController
  before_filter :verifier_acces
  CHEMIN = YAML::load_file("#{RAILS_ROOT}/config/conf_path_edit_filezip.yml")
  # GET /avoirs
  # GET /avoirs.xml
  def index
    #@compteur = 0
    @chemin = CHEMIN 
    @avoirs = Avoir.paginate(:per_page=>ByPage.new("fichiercompressions").page, :page => params[:page], :conditions=>{:application_id=>params[:id]}, :order=>"fichiercompression_id desc")
  end

  # GET /avoirs/1
  # GET /avoirs/1.xml
  def show
    @compteur = 0
    @chemin = CHEMIN
    @application_id = Avoir.find(params[:id]).application_id
    @avoirs = Avoir.paginate(:per_page=>ByPage.new("fichiercompressions").page, :page => params[:page], :conditions=>{:application_id=>@application_id}, :order=>"fichiercompression_id desc", :joins=>[:fichiercompression])
  end

  # GET /avoirs/new
  # GET /avoirs/new.xml
  def new
    @avoir = Avoir.new
  end

  # GET /avoirs/1/edit
  def edit
    #@fichiercompressions = Fichiercompression.all
    #@avoir = Avoir.find(params[:id])
    #@groupapp = @avoir.application.groupapp
    #@avoirs = Avoir.find(:all, :conditions=>{:applications=>{:groupapp_id=>@groupapp.id}}, :include=>[:application])
    @avoirs = Avoir.find(:all, :conditions=>{:fichiercompression_id=>params[:id].to_i})
  end

  # POST /avoirs
  # POST /avoirs.xml
  def create
    @avoir = Avoir.new(params[:avoir])
  end

  # PUT /avoirs/1
  # PUT /avoirs/1.xml
  def update
  end

  # DELETE /avoirs/1
  # DELETE /avoirs/1.xml
  def destroy
    @avoir = Avoir.find(params[:id])
    flash[:notice] = @avoir.destroy ? "La supression de cette version pour cette application s'est bien déroulé" : "La supression de cette version pour cette application ne s'est pas déroulé correctement elle est encore disponible"

    redirect_to(:back)
  end
end
