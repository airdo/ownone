class Match < ActiveRecord::Base
    validates :m_id, uniqueness: true
    
end
