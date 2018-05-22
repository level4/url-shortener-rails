class Api::VisitsController < ApplicationController

  def index
    visits = Redirect.find(params[:redirect_id]).visits
    render jsonapi: visits, class: { Visit: SerializableVisit }
  end

end
