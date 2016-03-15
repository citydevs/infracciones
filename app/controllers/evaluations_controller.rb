class EvaluationsController < ApplicationController
 skip_before_action :verify_authenticity_token
  def index
     @evaluations = Evaluation.all
      @userlist = @evaluations.map do |u|
        { :id => u.id, :identification => u.identification, :infraccion => u.infraccion, :articulo => u.articulo, :coincidio => u.coincidio,
          :documents=> u.documents, :copy => u.copy, :latitude => u.latitude, :longitude => u.longitude, :cop => Cop.find(u.cop_id),
          :created_at => u.created_at
        }
      end
        json = { :evaluations => @userlist }.to_json
        render json: json
  end
   def create
    cop_id = Cop.where(placa: params[:cop_id]).first
    unless cop_id.nil?
      @evaluation = Evaluation.new(evaluation_params)
      respond_to do |format|
        if @evaluation.save
          format.html { redirect_to @evaluation, notice: 'evaluation was successfully created.' }
          render json: {msg: "Evaluación enviada correctamente"}
        else
          format.html { render :new }
          format.json { render json: @evaluation.errors, status: :unprocessable_entity }
        end
      end
    else
      render json: [aviso: 'policia no encontrado']
   end
  
  end

private 
 def evaluation_params
      params.require(:evaluation).permit(:identification, :infraccion, :articulo, :coincidio, :documents, :copy, :latitude, :longitude, :cop_id, :created_at)
  end

end
