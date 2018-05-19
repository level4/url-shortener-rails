class HomeController < ApplicationController

  def index
    @form = CreateRedirectForm.new
  end

end
