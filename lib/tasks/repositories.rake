namespace "repositories" do
    desc "Import to database all characters and items that need it"
    task :scan => :environment do

        repositories = Repository.where()
        repositories.each do |repository|
            puts "Process repository '#{repository.name}'"
            repository.scan
        end
        puts "DONE"
    end
end

