class VkPost < ActiveRecord::Base
    before_validation :create_post
    
    
    def create_post
        current_match = MatchesList.find_by m_id: self.m_id
        format = Nokogiri::HTML(open(current_match.link)).css('div#mapformatbox').text.split(' ')[2]
        message = 'Game '+current_match.team1.to_s+' VS. '+current_match.team2.to_s+ ' Best of '+format.to_s
        html = 'https://api.vk.com/method/wall.post?owner_id=-66597298&from_group=1&message="'+message+'"&access_token=3f236b7160e499f5a5cb906005329f1198970a66ae9e7b7b02e8f040c313e1130f88f0f371cc1f32b3468'
        pid = JSON.parse((Net::HTTP.get_response(URI(html))).body)
        self.post_id = pid["response"]["post_id"] 
    end
end
