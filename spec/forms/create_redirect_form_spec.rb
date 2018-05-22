require 'rails_helper'

describe CreateRedirectForm do
  describe "#process" do
    let(:klass) { CreateRedirectForm }

    it "validates presence of URL" do
      object = klass.new(url: '')
      expect(object.valid?).to eq(false)
      expect(object.errors.keys).to eq([:url])
    end

    it "valides structure of URL" do
      object = klass.new(url: 'hello@kitty.com')
      expect(object.valid?).to eq(false)
      expect(object.errors.keys).to eq([:url])
    end

    it "passed correctly formatted URL" do
      object = klass.new(url: "http://hello-kitty.com/")
      expect(object.valid?).to eq(true)
    end

    it "adds http:// to URLs if missing" do
      object = klass.new(url: "hello-kitty.com/")
      object.normalize_url
      expect(object.url).to eq("http://hello-kitty.com/")
    end

    it "validates URL viability" do
      object = klass.new(url: "2")
      expect(object.valid?).to eq(false)
    end

    it "adds trailing slash to URL if missing" do
      object = klass.new(url: "hello-kitty.com")
      object.normalize_url
      expect(object.url).to eq("http://hello-kitty.com/")
      expect(object.valid?).to eq(true)
    end

    it "honours full paths" do
      object = klass.new(url: "http://hello-kitty.com/yes")
      object.normalize_url
      expect(object.url).to eq("http://hello-kitty.com/yes")
    end

  end

end
