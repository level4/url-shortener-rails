class Redirect < ApplicationRecord
  include Dry::Monads::Either::Mixin

  def self.find_by_code(code)
    id = Base62.short_to_id(code)
    res = find(id)
    if res
      Right(res)
    else
      # cannot get here - will raise on not found error
    end
  end

  def short_url
    Rails.configuration.x.base_url + 'r/' + Base62.id_to_short(id)
  end

end