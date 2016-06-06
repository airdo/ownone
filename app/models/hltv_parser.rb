require 'date'

class Hltv
  def self.parse(*p)
    if p[0]
        current_match = MatchesList.find_by m_id: p[0]
        match_html = Nokogiri::HTML(open(current_match.link))
        
        format = match_html.css('div#mapformatbox').text.split(' ')[2]
        maps = match_html.css('.hotmatchbox')
        ct_team = match_html.css('.scoreboard-identityColumns')[0]
        ct_score = match_html.css('.scoreboard-ctScore').text
        t_team = match_html.css('.scoreboard-identityColumns')[1]
        t_score = match_html.css('.scoreboard-tScore').text
        
        result = {
          format: format,
          maps: maps,
          ct_team: ct_team,
          ct_score: ct_score,
          t_team: t_team,
          t_score: t_score
        }
        
        return result
    else 
      all_matches_html=Nokogiri::HTML(open('http://www.hltv.org/matches/'))
      
      match_date = all_matches_html.css('.matchListDateBox')[0].text
      match_date = DateTime.parse(match_date)
      
      today_matches = all_matches_html.css(".matchListRow").map {  |match|
        s=match.css('.matchTimeCell').text
        
        time = s.split(":")[1] ? DateTime.parse(s)+1/24.0 : s 
        
        team1=match.css(".matchTeam1Cell a").text.to_s.strip
        t1_logo = match.at_css(".matchTeam1Cell a span img").attr('src') if match.at_css(".matchTeam1Cell a span img")
        team2=match.css(".matchTeam2Cell a").text.to_s.strip
        t2_logo = match.at_css(".matchTeam2Cell a span img").attr('src') if match.at_css(".matchTeam2Cell a span img")
        link = 'http://hltv.org' + match.at_css(".matchActionCell a").attr('href')
        m_id = match.at_css(".matchActionCell a").attr('href').split('/')[2].split('-').first.to_i
        
        MatchesList.create(team1: team1, team2: team2,
                          t1_logo: t1_logo, t2_logo: t2_logo, link: link, m_id: m_id, game_date: match_date)
        Match.create(m_id: m_id, link: link)
        
        {
          team1: team1,
          team2: team2,
          t1_logo: t1_logo,
          t2_logo: t2_logo,
          link: link,
          m_id: m_id,
          time: time
         }
        }
        return today_matches
    end
        
  end
end