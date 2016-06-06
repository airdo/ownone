class Vk
    
    attr_accessor :id
    
    ACCESS_TOKEN = '3f236b7160e499f5a5cb906005329f1198970a66ae9e7b7b02e8f040c313e1130f88f0f371cc1f32b3468'
    USER_ID=16412757
    GROUP_ID='66597298'
    
    def initialize(id)
        @id = id
        @current_match_data = MatchesList.find_by m_id: @id    
        @current_match_links = Match.find_by m_id: @id
        
        team1 = @current_match_data.team1
        team2 = @current_match_data.team2
        
        current_match_html = Nokogiri::HTML(open(@current_match_data.link))
        current_match_format = current_match_html.css('div#mapformatbox').text.split(' ')[2]
    
        @post_message = 'Game '+team1+' VS. '+team2+ ' Best of '+current_match_format
        @method = 'wall.post'
        @vk_post_former = 'https://api.vk.com/method/'
        
    end
    
    def already_posted?
        (Match.find_by m_id: @id).post_id ? true : false
    end
    
    def send
        if already_posted?
            make_post('addComment') 
            response_id = JSON.parse((Net::HTTP.get_response(URI(@vk_post_former))).body)["response"]["comment_id"] 
            @current_match_links.update(comment_id: response_id)
        else
            make_post
            response_id = JSON.parse((Net::HTTP.get_response(URI(@vk_post_former))).body)["response"]["post_id"] 
            @current_match_links.update(post_id: response_id)
        end
        
        return  response_id
    end
    
    
    
    private
    def make_post(method = 'wall.post')
        if method == 'wall.addComment'
    		@parameters = @current_match_links.post_id.to_s + '&'
    		@post_message = 'map score'
    		@former= method+'?owner_id=-'+GROUP_ID+'&from_group=1&'+@parameters+'message="'+@post_message+'"&access_token='+ACCESS_TOKEN 
    	else 
    		method = 'wall.post'
    		@former = method+'?owner_id=-'+GROUP_ID+'&from_group=1&message="'+@post_message+'"&access_token='+ACCESS_TOKEN
    	end
    	    @vk_post_former += @former
    end
    
end
