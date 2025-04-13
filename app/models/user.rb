class User < ApplicationRecord
    has_many :events, foreign_key: 'creator_id', class_name: 'Event'
    has_many :attendances
    has_man :attended_events, through: :attendances, source: :event 
end
