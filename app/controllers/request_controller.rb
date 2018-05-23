class RequestController < ApplicationController
  include Dry::Monads::Either::Mixin

  def show
    # will raise if not found
    lookup = Redirect.find_by_code(params[:id])

    all_headers = request.env.select {|k,v| k =~ /^HTTP_/}

    Visit.create!(
      redirect_id: lookup.id,
      referrer: request.referer,
      user_agent: request.user_agent,
      ip: request.remote_ip,
      headers: all_headers
    )

    redirect_to lookup.url
  end

end
