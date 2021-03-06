class User < ActiveRecord::Base
  has_many :items
  has_secure_password
  validates_presence_of :username, :email, :password

  def slug
    self.username.downcase.strip.gsub(' ', '-')
  end

  def self.find_by_slug(slug)
    self.all.each do |s|
      if s.slug == slug
        return s
      end
    end
  end
end
