# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  email      :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  
  validates :email, presence: true, uniqueness: true
  
  has_many :submitted_urls,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'ShortenedUrl'
    
  has_many :visited,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'Visit'
    
  
  has_many :visited_urls,
    through: :visited,
    source: :short_url
    # {}.each do |_, v|
    # end 
end
