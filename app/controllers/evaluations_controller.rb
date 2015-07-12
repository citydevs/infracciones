class EvaluationsController < ApplicationController

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

private 
 def evaluation_params
      params.require(:evaluation).permit(:identification, :infraccion, :articulo, :coincidio, :documents, :copy, :latitude, :longitude, :cop_id, :created_at)
  end

end
