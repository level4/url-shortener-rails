class Api::RedirectsController < ApplicationController

  def index
    redirects = Redirect.all
    render jsonapi: redirects, class: { Redirect: SerializableRedirect }
  end


  def show

  end

end
