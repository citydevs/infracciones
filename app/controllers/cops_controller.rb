class CopsController < ApplicationController
  before_action :set_cop, only: [:show, :edit, :update, :destroy]
  # GET /cops
  # GET /cops.json
  def index

    if up_to_date?
      #reload_cops("http://201.144.220.174/infracciones/api/personal/acreditado")
    end
    
    @cops = Cop.all
    

    if params[:tipo] == 'incidentes'
      incidentes_fill
    elsif params[:tipo] == 'cop'
      @evaluacions= Evaluation.all
      @hash = Gmaps4rails.build_markers(@evaluacions) do |cop, marker|
        marker.lat  cop.latitude
        marker.lng  cop.longitude
        marker.infowindow cop.cop_id
      end
    else 
      incidentes_fill
    end
    @count =Evaluation.all.count 

    unless @count == 0
      @identificacion = Evaluation.all.sum(:identification) * 100 / @count
      @infraccion = Evaluation.all.sum(:infraccion) * 100 / @count
      @articulo = Evaluation.all.sum(:articulo)* 100 / @count
      @coincidio = Evaluation.all.sum(:coincidio)* 100 / @count
      @documents = Evaluation.all.sum(:documents)* 100 / @count
      @copy = Evaluation.all.sum(:copy)* 100 / @count
    else
      @identificacion = 0
      @infraccion = 0
      @articulo = 0
      @coincidio = 0
      @documents = 0
      @copy = 0
    end


  end

  def incidentes_fill
    @incidents = Incident.all
    @hash = Gmaps4rails.build_markers(@incidents) do |eva, marker|
      marker.lat  eva.latitude
      marker.lng  eva.longitude
      marker.infowindow eva.fecha
    end
  end

  # GET /cops/1
  # GET /cops/1.json
  def show
  end

  # GET /cops/new
  def new

    identification = params[:identification]
    infraccion = params[:infraccion]
    articulo = params[:articulo]
    coincidio = params[:coincidio]
    documents = params[:documents]
    copy = params[:copy]
    latitude = params[:latitude]
    longitude = params[:longitude]
    cop_id = Cop.where(placa: params[:cop_id]).first

    unless cop_id.nil?
      a =  Evaluation.create(
        identification: identification, 
        infraccion: infraccion,
        articulo: articulo,
        coincidio: coincidio,
        documents: documents,
        copy: copy,
        latitude: latitude,
        longitude:longitude,
        cop_id: cop_id.id)
      if a.save
       render json: [aviso: 'OK']
     else
      render json: [aviso: 'falla']
    end
  else
   render json: [aviso: 'policia no encontrado']
 end
end

def get_evaluations
     
end

  # GET /cops/1/edit
  def edit
  end

  # POST /cops
  # POST /cops.json
  def create
    @cop = Cop.new(cop_params)

    respond_to do |format|
      if @cop.save
        format.html { redirect_to @cop, notice: 'cop was successfully created.' }
        format.json { render :show, status: :created, location: @cop }
      else
        format.html { render :new }
        format.json { render json: @cop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cops/1
  # PATCH/PUT /cops/1.json
  def update
    respond_to do |format|
      if @cop.update(cop_params)
        format.html { redirect_to @cop, notice: 'cop was successfully updated.' }
        format.json { render :show, status: :ok, location: @cop }
      else
        format.html { render :edit }
        format.json { render json: @cop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cops/1
  # DELETE /cops/1.json
  def destroy
    @cop.destroy
    respond_to do |format|
      format.html { redirect_to cops_url, notice: 'cop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

   def up_to_date? 
      if Cop.last.nil? || Cop.last.created_at < Time.now - 1.day
       return  true
      else
      return false
      end
  end


def reload_cops(url)
     json =  response = HTTParty.get(url)
      response = JSON.parse(json.body)
      Cop.delete_all
     response.each do |inf|
        Cop.create(nombre: inf['nombre_completo'], placa: inf['placa'] )
     end

end
    # Use callbacks to share common setup or constraints between actions.
    def set_cop
      @cop = cop.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cop_params
      params.require(:cop).permit(:nombre, :placa, :identificacion, :infraccion, :articulo, :sancion, :devolvio, :copia, :latitud, :longitud)
    end
  end
