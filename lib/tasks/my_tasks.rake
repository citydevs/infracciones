namespace :my_tasks do
 require 'csv'

  desc "Load Info policias to the db"
  task :load_polis  => :environment do |t, args| 

     cities_files = ['lib/datasets/cops.csv']
      Cop.delete_all
    cities_files.each do |city_file|
      CSV.foreach(city_file, :headers => true) do |row|
        nombre = row.to_hash['nombre']
        placa = row.to_hash['placa']

          Cop.create(nombre: nombre, placa: placa )
      end
    end
  end


  desc "Load Info conceptos to the db"
  task :load_conceptos  => :environment do |t, args| 

     cities_files = ['lib/datasets/conceptos.csv']
    
    cities_files.each do |city_file|
      CSV.foreach(city_file, :headers => true) do |row|
        infraccion = row.to_hash['infraccion']
        monto = row.to_hash['monto']
        corralon = row.to_hash['corralon']
        articulo = row.to_hash['articulo']
        fraccion = row.to_hash['fraccion']
        parrafo = row.to_hash['parrafo']
        inciso = row.to_hash['inciso']

          Concept.create(infraccion: infraccion, monto: monto,  corralon: corralon,  articulo: articulo,  fraccion: fraccion,  parrafo: parrafo,  inciso: inciso)
      end
    end
  end


  desc "Load Info incidentes to the db"
  task :load_incidentes  => :environment do |t, args| 

     cities_files = ['lib/datasets/incidentes.csv']
    
    cities_files.each do |city_file|
      CSV.foreach(city_file, :headers => true) do |row|
        tipo = row.to_hash['tipo']
        address = row.to_hash['direccion1']
        fecha = row.to_hash['fecha']
        latitude = row.to_hash['latitud']
        longitude = row.to_hash['longitud']

          Incident.create( tipo: tipo, address: address, fecha: fecha, latitude: latitude, longitude: longitude)
      end
    end
  end

def multiplica_
  
end


end

