class DistilleriesController < ApplicationController
  # GET /distilleries
  # GET /distilleries.xml
  def index
    @distilleries = Distillery.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @distilleries }
    end
  end

  # GET /distilleries/1
  # GET /distilleries/1.xml
  def show
    @distillery = Distillery.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @distillery }
    end
  end

  # GET /distilleries/new
  # GET /distilleries/new.xml
  def new
    @distillery = Distillery.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @distillery }
    end
  end

  # GET /distilleries/1/edit
  def edit
    @distillery = Distillery.find(params[:id])
  end

  # POST /distilleries
  # POST /distilleries.xml
  def create
    @distillery = Distillery.new(params[:distillery])

    respond_to do |format|
      if @distillery.save
        format.html { redirect_to(@distillery, :notice => 'Distillery was successfully created.') }
        format.xml  { render :xml => @distillery, :status => :created, :location => @distillery }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @distillery.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /distilleries/1
  # PUT /distilleries/1.xml
  def update
    @distillery = Distillery.find(params[:id])

    respond_to do |format|
      if @distillery.update_attributes(params[:distillery])
        format.html { redirect_to(@distillery, :notice => 'Distillery was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @distillery.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /distilleries/1
  # DELETE /distilleries/1.xml
  def destroy
    @distillery = Distillery.find(params[:id])
    @distillery.destroy

    respond_to do |format|
      format.html { redirect_to(distilleries_url) }
      format.xml  { head :ok }
    end
  end
end
