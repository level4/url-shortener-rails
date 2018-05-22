require 'uri'

class CreateRedirectForm
  include ActiveModel::Model
  include Dry::Monads::Either::Mixin

  attr_accessor :url

  validates :url, presence: true
  validate  :validate_url

  def process
    normalize_url
    if valid?
      result = Redirect.create!(url: url)
      Right(result)
    else
      Left(errors)
    end
  end

  # add protocol if missing. Go with http://
  def normalize_url
    parsed_url = URI.parse(url)
    if parsed_url.scheme.nil?
      @url = "http://#{url}"
    end
    rescue URI::InvalidURIError
  end

  def validate_url
    parsed_url = URI.parse(url)
    errors.add(:url, "Invalid URL") if parsed_url.host.nil?
  rescue URI::InvalidURIError
    errors.add(:url, "Invalid URL")
  end

end
