class Event < ApplicationRecord
    has_many :attendances
    has_many :attendees, through: :attendances, source: :user 
    belongs_to :creator, class_name: 'User'

    validates :title, presence: true
end
