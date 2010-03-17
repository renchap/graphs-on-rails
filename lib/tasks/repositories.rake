namespace "repositories" do
    desc "Scan all repositories"
    task :scan => :environment do

        repositories = Repository.where()
        repositories.each do |repository|
            puts "Process repository '#{repository.name}'"
            repository.scan
        end
        puts "DONE"
    end
end

