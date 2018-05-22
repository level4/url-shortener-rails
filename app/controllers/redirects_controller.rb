class RedirectsController < ApplicationController

  def create
    @form = CreateRedirectForm.new(create_params)

    res = @form.process
    if res.success?
      redirect_to redirect_path(res.value.id)
    else
      flash[:error] = "Invalid URL"
      render :new
    end
  end

  def show
    @redirect = Redirect.find(params[:id])
  end

  def new
    @form ||= CreateRedirectForm.new
  end

  def index
    @form ||= CreateRedirectForm.new
    render :new
  end

  protected

  def create_params
    params.require(:redirect).permit(:url)
  end

end
