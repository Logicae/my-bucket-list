class Item < ActiveRecord::Base
  belongs_to :user

  has_secure_password

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
