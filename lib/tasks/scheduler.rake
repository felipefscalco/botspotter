desc "Update players online"
task :update_players => :environment do
  Spotter::GetPlayers::call
end