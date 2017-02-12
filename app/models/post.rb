require 'active_model'
class Post
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations
  attr_accessor :blog, :body, :image_url, :pubdate, :title
  validates :title, presence: true
  def initialize(attrs={})
    attrs.each do |k, v|
      send("#{k}=", v)
    end
  end

  def publish(clock=DateTime)
    return false unless valid?
    self.pubdate = clock.now
    @blog.add_entry(self)
  end

  def persisted?
    false
  end

  def picture?
    image_url.present?
  end
end
