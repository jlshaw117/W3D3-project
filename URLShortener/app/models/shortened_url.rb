# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint(8)        not null, primary key
#  long_url   :text             not null
#  short_url  :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShortenedUrl < ApplicationRecord
  
  validates :long_url, presence: true, uniqueness: true
  
  def self.random_code
    str = SecureRandom::urlsafe_base64
    
    while ShortenedUrl.exists?(short_url: str)
      # checks if (argument) exists in database table
      str = SecureRandom::urlsafe_base64
    end
    str
  end
  # this will return short_url 
  
  def self.create!(user, string)
    str = ShortenedUrl.random_code
    ShortenedUrl.new(user_id: user.id, long_url: string, short_url: str)
  end
  
  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'
  
  has_many :visits,
    primary_key: :id,
    foreign_key: :short_url_id,
    class_name: 'Visit'
    
  
  has_many :visitors,
    through: :visits,
    source: :user
  
  
  # factory method will take 2 arguments (user object, long_url)
  # return ShortenedURL object via random_code generator
    
end
  
  

