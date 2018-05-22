require 'rails_helper'
include Dry::Monads::Either::Mixin

RSpec.describe RequestController, type: :controller do

  let(:redirect) { Redirect.create(url: "http://google.com") }

  it "should redirect on successful lookup" do
    expect(Redirect).to receive(:find_by_code).with(anything) { Right(redirect) }
    get :show, params: {id: redirect.short_url}
    expect(response.status).to eq(302)
  end

  it "should 404 on unsuccessful lookup" do
    expect{
      get :show, params: {id: 1001}
    }.to raise_exception(ActiveRecord::RecordNotFound)
    # expect(response.status).to eq(404)
  end

end
