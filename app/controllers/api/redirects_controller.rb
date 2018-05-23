class Api::RedirectsController < ApplicationController

  def index
    redirects = Redirect.newest_first.all
    render jsonapi: redirects, class: { Redirect: SerializableRedirect }
  end


end
