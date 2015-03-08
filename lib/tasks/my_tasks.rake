namespace :my_tasks do
 require 'csv'

  desc "Load Info policias to the db"
  task :load_polis  => :environment do |t, args| 

     cities_files = ['lib/datasets/test.csv']
    
    cities_files.each do |city_file|
      CSV.foreach(city_file, :headers => true) do |row|
        nombre = row.to_hash['nombre']
        placa = row.to_hash['placa']
        raking_honestidad = 0
         raking_trato  = 0

          Infraction.create(nombre: nombre, placa: placa , raking_honestidad: raking_honestidad, raking_trato: raking_trato)
      end

    end
  end
end

