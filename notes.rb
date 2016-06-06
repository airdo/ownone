def show
    
      
      @match = MatchesList.find_by m_id: params[:id]
      html = @match.link
      match_html=Nokogiri::HTML(open(html))
      
      @format = match_html.css('div#mapformatbox').text.split(' ')[2]
      @maps = match_html.css('.hotmatchbox')
      
      @ct_team=match_html.css('.scoreboard-identityColumns')[0]
      @ct_score = match_html.css('.scoreboard-ctScore').text
      @t_team=match_html.css('.scoreboard-identityColumns')[1]
      @t_score = match_html.css('.scoreboard-tScore').text
      
      
      # 321a25ce7d674c0268c30a1352659a62aff9f913a35dce740d07ae4511c3ea97df1e2285ba96ac2cde808
      @access_token = '3f236b7160e499f5a5cb906005329f1198970a66ae9e7b7b02e8f040c313e1130f88f0f371cc1f32b3468'
      @user_id=16412757
      @gid=66597298
      
      @message = 'Game '+@match.team1.to_s+' VS. '+@match.team2.to_s+ ' Best of '+@format.to_s
      @html= 'https://api.vk.com/method/wall.post?owner_id=-'+@gid.to_s+'&from_group=1&message="'+@message+'"&access_token='+@access_token.to_s
      # result = JSON.parse((Net::HTTP.get_response(URI(html))).body)["response"]["post_id"]
      
      @result = (VkPost.find_by m_id: params[:id]) ?
                (JSON.parse((Net::HTTP.get_response(URI('https://api.vk.com/method/wall.addComment?owner_id=-'+@gid.to_s+'&from_group=1&message="'+@message+'"&access_token='+@access_token.to_s))).body)["response"]["comment_id"]) : 
                (VkPost.create(m_id: params[:id]))
      
      
      
end


@match = MatchesList.find_by m_id: params[:id]
      html = @match.link
      match_html=Nokogiri::HTML(open(html))
      
      @format = match_html.css('div#mapformatbox').text.split(' ')[2]
      @maps = match_html.css('.hotmatchbox')
      
      @ct_team=match_html.css('.scoreboard-identityColumns')[0]
      @ct_score = match_html.css('.scoreboard-ctScore').text
      @t_team=match_html.css('.scoreboard-identityColumns')[1]
      @t_score = match_html.css('.scoreboard-tScore').text
      
      
      # 321a25ce7d674c0268c30a1352659a62aff9f913a35dce740d07ae4511c3ea97df1e2285ba96ac2cde808
      @access_token = '3f236b7160e499f5a5cb906005329f1198970a66ae9e7b7b02e8f040c313e1130f88f0f371cc1f32b3468'
      @user_id=16412757
      @gid=66597298
      
      @message = 'Game '+@match.team1.to_s+' VS. '+@match.team2.to_s+ ' Best of '+@format.to_s
      @html= 'https://api.vk.com/method/wall.post?owner_id=-'+@gid.to_s+'&from_group=1&message="'+@message+'"&access_token='+@access_token.to_s
      # result = JSON.parse((Net::HTTP.get_response(URI(html))).body)["response"]["post_id"]
      
      @result = (VkPost.find_by m_id: params[:id]) ?
                (JSON.parse((Net::HTTP.get_response(URI('https://api.vk.com/method/wall.addComment?owner_id=-'+@gid.to_s+'&from_group=1&message="'+@message+'"&access_token='+@access_token.to_s))).body)["response"]["comment_id"]) : 
                (VkPost.create(m_id: params[:id]))
      