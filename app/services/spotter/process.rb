module Spotter

    class Process

        def initialize(player)
            @player_info = player
        end

        def self.call(player)
            new(player).call
        end

        def call
          player = Player.find_by(name: player_info[:name])

          if player.nil?
            Player.create(player_info)
          else
            uptime = ((player_info[:last_online] - player.last_online) / 1.hour).round
            if(uptime == 1)
                player.up_time += 1
            end
            
            player.last_online = player_info[:last_online]
            player.level = player_info[:level]
            player.vocation = player_info[:vocation]
            player.online = true

            player.save
          end
           
        end

        private

        attr_reader :player_info
    end
end