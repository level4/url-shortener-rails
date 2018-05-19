class RedirectsController < ApplicationController

  def create
    @form = CreateRedirectForm.new(create_params)

    @form.process
    render :show
  end

  def show

  end

  protected

  def create_params
    params.permit(:redirect)
  end

end
