namespace :task2 do
 require 'csv'

  desc "Load Info conceptos to the db"
  task :load_conceptos  => :environment do |t, args| 

     cities_files = ['lib/datasets/conceptos.csv']
    
    cities_files.each do |city_file|
      CSV.foreach(city_file, :headers => true) do |row|
        infraccion = row.to_hash['infraccion']
        monto = row.to_hash['monto']
        corralon = row.to_hash['corralon']
        

          Concept.create(infraccion: infraccion, monto: monto , corralon: corralon)
      end

    end
  end
end

