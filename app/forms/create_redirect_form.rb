class CreateRedirectForm
  include ActiveModel::Model
  include Dry::Monads::Either::Mixin

  attr_accessor :url

  def process
    if valid?
      Right(nil)
    else
      Left(errors)
    end
  end


end
