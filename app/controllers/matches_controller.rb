class MatchesController < ApplicationController
    require 'open-uri'
    require 'net/http'
    require 'json'
    require 'hltv_parser'
    # require 'vk_class'
    
    
    def index
      @matches = Hltv.parse
    end
    
    def show
      @match = MatchesList.find_by m_id: params[:id]
      @match_stats = Hltv.parse(params[:id])
    end
    
    def past
      @matches = MatchesList.all
    end
   
    def post
      @current_match = VK::Application.new(app_id: 66597298, access_token: '3f236b7160e499f5a5cb906005329f1198970a66ae9e7b7b02e8f040c313e1130f88f0f371cc1f32b3468')
    end
   
    private
    def post_params
      params.require(:vk_posts).permit(:id)
    end
    
end
