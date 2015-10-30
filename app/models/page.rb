class Page < ActiveRecord::Base
  attr_accessor :body, :title, :slug

  def self.find(slug)
    find_by_slug(slug)
  end

  def to_param
    slug
  end

end
