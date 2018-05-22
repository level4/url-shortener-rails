class RequestController < ApplicationController
  include Dry::Monads::Either::Mixin

  def show
    # will raise if not found
    lookup = Redirect.find_by_code(params[:id])
    redirect_to lookup.url
  end

end
