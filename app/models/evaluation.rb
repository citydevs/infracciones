class Evaluation < ActiveRecord::Base
    belongs_to :cop
    validates :identification, :infraccion, :articulo, :coincidio, :documents, :copy, :latitude, :longitude, :cop_id , presence: true 
end
