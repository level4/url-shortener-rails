class Redirect < ApplicationRecord
  include Dry::Monads::Either::Mixin

  has_many :visits

  scope :newest_first, -> { order("id desc") }

  def self.find_by_code(code)
    id = Base62.short_to_id(code)
    find(id)
  end

  def short_url
    Rails.configuration.x.base_url + 'r/' + short_code
  end

  def short_code
    Base62.id_to_short(id)
  end

end
