class MatchesList < ActiveRecord::Base
    before_validation :create_match_table_item
    after_find :test
    
    validates :m_id, uniqueness: true
    
    private
    def create_match_table_item
        Match.create(m_id: :m_id)
    end
    
    def test
        @mmm = 'WORKED'
    end
end
