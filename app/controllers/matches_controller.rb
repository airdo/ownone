class MatchesController < ApplicationController
    require 'open-uri'
    require 'net/http'
    require 'json'
    require 'hltv_parser'
    require 'vk_class'
    def index
      @matches = Hltv.parse
    end
    
    def show
      @match = MatchesList.find_by m_id: params[:id]
      @match_stats = Hltv.parse(params[:id])
      @current_match = Vk.new(params[:id])
    end
    
    def past
      @matches = MatchesList.all
    end
   
    private
    def post_params
      params.require(:vk_posts).permit(:id)
    end
    
end
