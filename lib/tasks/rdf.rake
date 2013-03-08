namespace :rdf do

  desc 'Create Catalogue of Life RDF'
  task :create_col_rdf => :environment do
    EOL::RDF.create_col_rdf
  end

  desc 'load_catalogue_of_life'
  task :load_catalogue_of_life => :environment do
    EOL::RDF.load_catalogue_of_life
  end

  desc 'load_users'
  task :load_users => :environment do
    EOL::RDF.load_users
  end

  desc 'load_obis'
  task :load_obis => :environment do
    EOL::RDF.load_obis
  end

  desc 'load_anage'
  task :load_anage => :environment do
    EOL::RDF.load_anage
  end

end
