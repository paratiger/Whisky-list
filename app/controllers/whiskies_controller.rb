class WhiskiesController < ApplicationController
  # GET /whiskies
  # GET /whiskies.xml
  def index
    @whiskies = Whisky.order("title ASC").all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @whiskies }
    end
  end

  # GET /whiskies/1
  # GET /whiskies/1.xml
  def show
    @whisky = Whisky.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @whisky }
    end
  end

  # GET /whiskies/new
  # GET /whiskies/new.xml
  def new
    @whisky = Whisky.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @whisky }
    end
  end

  # GET /whiskies/1/edit
  def edit
    @whisky = Whisky.find(params[:id])
  end

  # POST /whiskies
  # POST /whiskies.xml
  def create
    @whisky = Whisky.new(params[:whisky])

    respond_to do |format|
      if @whisky.save
        format.html { redirect_to(@whisky, :notice => 'Whisky was successfully created.') }
        format.xml  { render :xml => @whisky, :status => :created, :location => @whisky }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @whisky.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /whiskies/1
  # PUT /whiskies/1.xml
  def update
    @whisky = Whisky.find(params[:id])

    respond_to do |format|
      if @whisky.update_attributes(params[:whisky])
        format.html { redirect_to(@whisky, :notice => 'Whisky was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @whisky.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /whiskies/1
  # DELETE /whiskies/1.xml
  def destroy
    @whisky = Whisky.find(params[:id])
    @whisky.destroy

    respond_to do |format|
      format.html { redirect_to(whiskies_url) }
      format.xml  { head :ok }
    end
  end
end
