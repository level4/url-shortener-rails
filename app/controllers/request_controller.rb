class RequestController < ApplicationController
  include Dry::Monads::Either::Mixin

  def show
    # will raise if not found
    lookup = Redirect.find_by_code(params[:id])
    if lookup.success?
      redirect_to lookup.value.url
    else
      # 404 - will not handle here
    end
  end

end
