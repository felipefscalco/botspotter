module Spotter

  class GetPlayers

    NAME=0
    LEVEL=1
    VOCATION=2

    def self.call
      agent = Mechanize.new
      page = agent.get(ENV.fetch("OT_URL")) 
      
      players_table = page.search('table#WorldOverViewList tr')
      players_table.shift #remove first element of array

      players_table.each do | player_info |
        info = player_info.search('td')
        
        player = {
          name: info[NAME].text,
          level: info[LEVEL].text,
          vocation: info[VOCATION].text,
          online: true,
          last_online: Time.zone.now
        }

        Spotter::Process.call(player)

      end

    end

  end

end