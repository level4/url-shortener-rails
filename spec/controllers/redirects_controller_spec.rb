require 'rails_helper'

RSpec.describe RedirectsController, type: :controller do

  context "#create" do
    let(:valid_params) {
      { redirect: {url: "http://google.com"} }
    }

    let(:invalid_params) {
      { redirect: {url: "google.co2"} }
    }

    it "should create a new redirect with a valid URL" do
      expect{
        post :create, params: valid_params
      }.to change{Redirect.count}.by(1)
    end

    it "should not create a new redirect with an invalid URL" do
      expect{
        post :create, params: invalid_params
      }.to change{Redirect.count}.by(0)
    end

  end


end
