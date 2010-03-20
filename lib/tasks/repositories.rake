namespace "repositories" do
  desc "Scan all repositories"
  task :scan => :environment do
    puts "Scanning all repositories..."
    repositories = Repository.all
    repositories.each do |repository|
      print " Process repository '#{repository.name}'..."
      repository.scan
      puts " Done"
    end
    puts "All repositories scanned."
  end
end

