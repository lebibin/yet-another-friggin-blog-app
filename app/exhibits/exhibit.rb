require 'delegate'
class Exhibit < SimpleDelegator
  def initialize(model, context)
    @context = context
    super(model)
  end
  def self.exhibit(model, context)
    # Doing a string comparison because of Rails class-reloading weirdness
    case model.class.name
    when 'Post'
      if model.picture?
        PicturePostExhibit.new(model, context)
      else
        TextPostExhibit.new(model, context)
      end
    else
      model
    end
  end
  def to_model
    __getobj__
  end
  def class
    __getobj__.class
  end
end
