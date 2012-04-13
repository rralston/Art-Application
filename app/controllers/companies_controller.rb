class CompaniesController < ApplicationController
  # GET /companies
  # GET /companies.json
  layout "mobile"
  
  def distance

      #get all the companies from the database
      companies = Company.all
      return_data = Array.new

      #for each company calculate the distance and set the result on an Array
      companies.each do |company|
        distance =   Geocoder::Calculations.distance_between([company.latitude,company.longitude],[params[:latitude].to_f,params[:longitude].to_f])
        data = {:company_id => company.id, :distance => distance}
        return_data.push data
      end

      #store the latitude and longitud into the session for future usage
      session[:latitude] = params[:latitude]
      session[:longitude] = params[:longitude]

      #return the array with the result on a Json
      render :json => return_data

    end

   
    def index
      @companies = Company.all
    # @lat_lng = cookies[:lat_lng].split("|")
    # @companies.each{|company|company.distance =   Geocoder::Calculations.distance_between([company.latitude,company.longitude], [@lat_lng[0].to_f,@lat_lng[1].to_f])}
      respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @companies }
    end
end

  # GET /companies/1
  # GET /companies/1.json
  def show
    # returns Geocoder::Result object
    @company = Company.find(params[:id])
    # @lat_lng = cookies[:lat_lng].to_s().tr("|", ",")
    @long = request.location.longitude
    @lat = request.location.latitude
    @ip = request.ip
    @city = request.location.city
   # @current = Event.where(:company_id => [params[:id]], :limit => 1)
   @event = Event.where(:company_id => (params[:id]), :limit => 1)
   @oevent = Event.where(:company_id => (params[:id]), :limit => 5)
    @json = Company.find(params[:id]).to_gmaps4rails
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @company }
    end
  end

  # GET /companies/new
  # GET /companies/new.json
  def new
    @company = Company.new(:name => 'default')
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @company }
    end
  end

  # GET /companies/1/edit
  def edit
    @company = Company.find(params[:id])    
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(params[:company])

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, :notice => 'Company was successfully created.' }
        format.json { render :json => @company, :status => :created, :location => @company }
      else
        format.html { render :action => "new" }
        format.json { render :json => @company.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /companies/1
  # PUT /companies/1.json
  def update
    @company = Company.find(params[:id])

    respond_to do |format|
      if @company.update_attributes(params[:company])
        format.html { redirect_to @company, :notice => 'Company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @company.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company = Company.find(params[:id])
    @company.destroy

    respond_to do |format|
      format.html { redirect_to companies_url }
      format.json { head :no_content }
    end
  end
end
