module Spotter

  class GetPlayers

    NAME = 2
    LEVEL = 4
    VOCATION = 3

    def self.call
      Player.update_all online: false

      agent = Mechanize.new
      page = agent.get(ENV.fetch("OT_URLL"))
      players_table = page.search('#onlinelistTable')
      players_info = players_table.search('tr')
      players_info.shift

      players_info.each do |player_info|
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

      Player.offline.update_all(up_time: 0)
    end
  end
end
