namespace :my_tasks do
 require 'csv'

  desc "Load Info conceptos to the db"
  task :load_conceptos  => :environment do |t, args| 

     cities_files = ['lib/datasets/conceptos.csv']
      Concept.delete_all
    cities_files.each do |city_file|
      CSV.foreach(city_file, :headers => true) do |row|
        infraccion = row.to_hash['infraccion']
        monto = multiplica_salarios(row.to_hash['monto'])
        corralon = row.to_hash['corralon']
        articulo = row.to_hash['articulo']
        fraccion = row.to_hash['fraccion']
        parrafo = row.to_hash['parrafo']
        inciso = row.to_hash['inciso']
        puntos = row.to_hash['puntos']
        
        Concept.create(infraccion: infraccion, monto: monto,  corralon: corralon,  articulo: articulo,  fraccion: fraccion,  parrafo: parrafo,  inciso: inciso,  puntos: puntos)
      end
    end
  end


def multiplica_salarios( base)
      (base.to_i * 70.10 ).to_i
end


end

